//
//  DRAnimationBlockDelegate.m
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "DRAnimationBlockDelegate.h"

@implementation DRAnimationBlockDelegate
+ (instancetype)animationDelegateWithBeginning:(void (^)(void))beginning
                                    completion:(void (^)(BOOL))completion
{
    DRAnimationBlockDelegate *result = [DRAnimationBlockDelegate new];
    result.start = beginning;
    result.stop  = completion;
    return result;
}

- (void)animationDidStart:(CAAnimation *)anim
{
    if (self.start) {
        self.start();
    }
    self.start = nil;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (self.stop) {
        self.stop(flag);
    }
    self.stop = nil;
}
@end
