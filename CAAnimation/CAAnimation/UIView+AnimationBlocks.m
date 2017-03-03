//
//  UIView+AnimationBlocks.m
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "UIView+AnimationBlocks.h"
#import <objc/runtime.h>
#import "DRSavedPopAnimationState.h"

static void *DR_currentAnimationContext = NULL;
static void *DR_popAnimationContext     = &DR_popAnimationContext;
static NSString *DR_savedPopAnimationStatesCtx = @"array";
static NSString *array = @"123";

@implementation UIView (AnimationBlocks)


+ (NSMutableArray *)DR_savedPopAnimationStates {
    
    NSMutableArray *oldArray = objc_getAssociatedObject(array, &DR_savedPopAnimationStatesCtx);
    if (!oldArray) {
        
        oldArray = [NSMutableArray array];
        objc_setAssociatedObject(array, &DR_savedPopAnimationStatesCtx, oldArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return oldArray;

}

+ (void)load {
    
    SEL originalSelector = @selector(actionForLayer:forKey:);
    SEL extendedSelector = @selector(DR_actionForLayer:forKey:);
    
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method extendedMethod = class_getInstanceMethod(self, extendedSelector);
    
    NSAssert(originalMethod, @"original method should exist");
    NSAssert(extendedMethod, @"exchanged method should exist");
    
    if(class_addMethod(self, originalSelector, method_getImplementation(extendedMethod), method_getTypeEncoding(extendedMethod))) {
        class_replaceMethod(self, extendedSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, extendedMethod);
    }
    
    
}

- (id<CAAction>)DR_actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
    
    
    
    if (DR_currentAnimationContext == DR_popAnimationContext) {
        // 这里写我们自定义的代码...
        
        DRSavedPopAnimationState *state = [DRSavedPopAnimationState savedStateWithLayer:layer keyPath:event];
        [[UIView DR_savedPopAnimationStates] addObject:state];
        
    }
    
    // 调用原始方法
    return [self DR_actionForLayer:layer forKey:event]; // 没错，你没看错。因为它们已经被交换了
}

+ (void)DR_popAnimationWithDuration:(NSTimeInterval)duration
                         animations:(void (^)(void))animations
{
    DR_currentAnimationContext = DR_popAnimationContext;
    
    // 执行动画 (它将触发交换后的 delegate 方法)
    animations();
    
    NSMutableArray *states = [UIView DR_savedPopAnimationStates];
    for (DRSavedPopAnimationState *state in states) {
        
        DRSavedPopAnimationState *savedState   = (DRSavedPopAnimationState *)state;
        CALayer *layer    = savedState.layer;
        NSString *keyPath = savedState.keyPath;
        id oldValue       = savedState.oldValue;
        id newValue       = [layer valueForKeyPath:keyPath];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:keyPath];
        
        CGFloat easing = 0.2;
        CAMediaTimingFunction *easeIn  = [CAMediaTimingFunction functionWithControlPoints:1.0 :0.0 :(1.0-easing) :1.0];
        CAMediaTimingFunction *easeOut = [CAMediaTimingFunction functionWithControlPoints:easing :0.0 :0.0 :1.0];
        
        anim.duration = duration;
        anim.keyTimes = @[@0, @(0.35), @1];
        anim.values = @[oldValue, newValue, oldValue];
        anim.timingFunctions = @[easeIn, easeOut];
        
        // 不带动画地返回原来的值
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [layer setValue:oldValue forKeyPath:keyPath];
        [CATransaction commit];
        
        // 添加 "pop" 动画
        [layer addAnimation:anim forKey:keyPath];
        
    }
    
    [states removeAllObjects];
    
    /* 一会儿再添加 */
    DR_currentAnimationContext = NULL;
}



@end
