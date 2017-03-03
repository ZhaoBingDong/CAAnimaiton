//
//  DRSavedPopAnimationState.h
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface DRSavedPopAnimationState : NSObject

@property (strong) CALayer  *layer;
@property (copy)   NSString *keyPath;
@property (strong) id        oldValue;

+ (instancetype)savedStateWithLayer:(CALayer *)layer
                            keyPath:(NSString *)keyPath;

@end
