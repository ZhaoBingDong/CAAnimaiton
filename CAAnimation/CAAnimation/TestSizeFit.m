//
//  TestSizeFit.m
//  AFNetworking
//
//  Created by WilliamChen on 17/3/3.
//  Copyright © 2017年 AFNetworking. All rights reserved.
//

#import "TestSizeFit.h"

@implementation TestSizeFit {
    UILabel *_label1;
    UILabel *_label2;
    CGFloat _margin;
    
    CGSize _cacheSize1;
    CGSize _cacheSize2;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label1 = [UILabel new];
        _label1.numberOfLines = 0;
        _label1.backgroundColor = [UIColor orangeColor];
        
        _label2 = [UILabel new];
        _label2.numberOfLines = 0;
        _label2.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:_label1];
        [self addSubview:_label2];
        
        _margin = 5.0;
        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _label1.frame = CGRectMake(_margin, _margin, _cacheSize1.width, _cacheSize1.height);
    _label2.frame = CGRectMake(_margin, CGRectGetMaxY(_label1.frame) + _margin, _cacheSize2.width, _cacheSize2.height);
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGFloat w = size.width;
    w -= 2 * _margin;
    
    _cacheSize1 = [_label1 sizeThatFits:CGSizeMake(w, MAXFLOAT)];
    _cacheSize2 = [_label2 sizeThatFits:CGSizeMake(w, MAXFLOAT)];
    CGFloat h = 3 * _margin + _cacheSize1.height + _cacheSize2.height;
    
    return CGSizeMake(size.width, h);
}

- (void)setLabel1Text:(NSString *)text1 setLabel2Text:(NSString *)text2
{
    _label1.text = text1;
    _label2.text = text2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
