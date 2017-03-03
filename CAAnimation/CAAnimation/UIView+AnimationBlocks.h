//
//  UIView+AnimationBlocks.h
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AnimationBlocks)

+ (void)DR_popAnimationWithDuration:(NSTimeInterval)duration
                         animations:(void (^)(void))animations;

+ (NSMutableArray *_Nonnull)DR_savedPopAnimationStates;

@end
