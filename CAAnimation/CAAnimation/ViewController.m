//
//  ViewController.m
//  CAAnimation
//
//  Created by 董招兵 on 2017/3/2.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "DRAnimationBlockDelegate.h"
#import "UIView+AnimationBlocks.h"
#import "MyLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UILabel *label          = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 0.0f, 0.0f)];
    label.backgroundColor   = [UIColor yellowColor];
    label.text              = @"hello world33333333333333333333333";
    label.numberOfLines     = 1;
    CGSize newSize          =  [label sizeThatFits:CGSizeMake(200.0f, 20.0f)];
    CGRect rect             = CGRectMake(label.frame.origin.x, label.frame.origin.y, newSize.width, newSize.height);
    label.frame             = rect;
    
    label.transform         = CGAffineTransformIdentity;
    NSLog(@"--%@",NSStringFromCGSize(newSize));
    
    [self.view addSubview:label];

    
//    // 红色的 view
//    UIView *redView                 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 110.0f, 50.0f)];
//    redView.backgroundColor         = [UIColor redColor];
//    redView.tag                     = 200;
//    [label addSubview:redView];
//    
  
//
//    
//    
//    // 蓝色 View
//    UIView *blueView                                    = [[UIView alloc] init];
//    blueView.backgroundColor                            = [UIColor blueColor];
//    blueView.translatesAutoresizingMaskIntoConstraints  = NO;
//    [self.view addSubview:blueView];
//    
//    
//    
////    // 红色 view 的宽度度
////    NSLayoutConstraint *redViewWidth = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0.0 constant:100.0f];
////    [redView addConstraint:redViewWidth];
//    
//    // 红色 view 的高度
//    NSLayoutConstraint *redViewHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0.0f constant:100.0f];
//    [redView addConstraint:redViewHeight];
//
//    //  红色 view右边的约束
//    NSLayoutConstraint *redRightConstaint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f];
//    [self.view addConstraint:redRightConstaint];
//    
//    //  红色 view底部的约束
//    NSLayoutConstraint *bottomConstaint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-10.0f];
//    bottomConstaint.identifier          = @"bottom";
//    [self.view addConstraint:bottomConstaint];
// 
//    // 红色 view左边的约束
//    
//    NSLayoutConstraint *redViewLeftView = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f];
//    [self.view addConstraint:redViewLeftView];
//    
//    
//    // 蓝色 view 宽度
//    
//    NSLayoutConstraint *blueWidthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f];
//    [self.view addConstraint:blueWidthConstraint];
//    
//    // 蓝色 view 高度约束
//    NSLayoutConstraint *blueHeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];
//    [self.view addConstraint:blueHeightConstraint];
//
//    // 蓝色 view 的底部约束
//    NSLayoutConstraint *blueBottomConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
//    
//    [self.view addConstraint:blueBottomConstraint];
//
//    // 蓝色 view 的右边约束
//    
//    NSLayoutConstraint *blueRightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f];
//    [self.view addConstraint:blueRightConstraint];
//    
    
    
    

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
//    NSArray *array = [self.view constraints];
//    
//    for (NSLayoutConstraint *contraint in array) {
//        
//        if ([contraint.identifier isEqualToString:@"bottom"])  {
//            
//            [self.view removeConstraint:contraint];
//            UIView *redView = [self.view viewWithTag:200];
//            NSLayoutConstraint *newContraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-100.0f];
//            
//            [self.view addConstraint:newContraint];
//            [self.view updateConstraints];
//
//            
//            break;
//        }
//        
//    }
    
    
    [UIView DR_popAnimationWithDuration:0.25 animations:^{
        
        self.myView.transform = CGAffineTransformMakeRotation(M_PI_2);

    }];
    
    
    
//    
//    NSLog(@"outside animation block: %@",
//          [self.myView actionForLayer:self.myView.layer forKey:@"position"]);
//    
//    [UIView animateWithDuration:0.25f animations:^{
//        
//        id<CAAction> obj = [self.myView actionForLayer:self.myView.layer forKey:@"position"];
//        
//        NSLog(@"inside animation block: %@",obj);
//        
//
//    }];
//    
    
    
}
@end
