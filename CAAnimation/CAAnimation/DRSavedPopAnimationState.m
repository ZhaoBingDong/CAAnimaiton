//
//  DRSavedPopAnimationState.m
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "DRSavedPopAnimationState.h"

@implementation DRSavedPopAnimationState

+ (instancetype)savedStateWithLayer:(CALayer *)layer
                            keyPath:(NSString *)keyPath {
    
    DRSavedPopAnimationState *savedState = [DRSavedPopAnimationState new];
    savedState.layer    = layer;
    savedState.keyPath  = keyPath;
    savedState.oldValue = [layer valueForKeyPath:keyPath];
    return savedState;
    
}
@end
