//
//  MyView.m
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "MyView.h"
#import "MyLayer.h"
@implementation MyView


+ (Class)layerClass {
    
    return [MyLayer class];
}

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    
   return  [super actionForLayer:layer forKey:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
}

@end
