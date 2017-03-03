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
#import "TestSizeFit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
  
    [self labelSizeToFit];
    
    [self customerViewSizeToFit];
    

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [self customerAnimaiton];


}


/**
 UILabel 自适应大小
 */
- (void) labelSizeToFit {
    
    
    MyLabel *label1          = [[MyLabel alloc] initWithFrame:CGRectMake(0.0f, 200.0f, 100.0f, 0.0f)];
    label1.backgroundColor   = [UIColor yellowColor];
    label1.text              = @"当一个 view 例如 label 设置完 text 属性后 调用[label sizeToFit]; 会根据 label 内容计算出合适的 size 来完全显示 label 内容";
    label1.numberOfLines     = 0;
//    [label1 sizeToFit];
    
    // 或者给一个限定的宽度和高度 让 label 在这个范围内进行自适应 size
    CGSize labelSize = [label1 sizeThatFits:CGSizeMake([[UIScreen mainScreen] bounds].size.width, MAXFLOAT)];
    CGRect rect      = CGRectMake(label1.frame.origin.x, label1.frame.origin.y, labelSize.width, labelSize.height);
    [label1 setFrame:rect];
    
    [self.view addSubview:label1];
    
    
}

- (void) customerViewSizeToFit {
    
    TestSizeFit *customerView = [[TestSizeFit alloc] init];
    [customerView setLabel1Text:@"大兵布莱恩特" setLabel2Text:@"巴爷科技 (上海) 有限公司"];
    
    [customerView sizeToFit];
    
    [self.view addSubview:customerView];
    
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
