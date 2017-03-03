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

    
  
    [self labelSizeToFit];
    
    
    

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [self customerAnimaiton];


}


/**
 UILabel 自适应大小
 */
- (void) labelSizeToFit {
    
    
    UILabel *label1          = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 100.0f, 0.0f, 0.0f)];
    label1.backgroundColor   = [UIColor yellowColor];
    label1.text              = @"当一个 view 例如 label 设置完 text 属性后 调用[label sizeToFit]; 会根据 label 内容计算出合适的 size 来完全显示 label 内容";
    label1.numberOfLines     = 0;
    [label1 sizeToFit];
    
    [self.view addSubview:label1];
    
    
}


/**
 自定义动画相关
 */
- (void) customerAnimaiton {
    
    
    [UIView DR_popAnimationWithDuration:0.25 animations:^{
        
        self.myView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
    }];
    
    
    // 官方文档有关于 actionForLayer 三种返回结果 nil "[NSNull null] <null>" , id<CAAction>
    // 这个方法只是测试下 当改变 view 一些属性时 能不能根据 keypath找到这个动画对象
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

    
}

@end
