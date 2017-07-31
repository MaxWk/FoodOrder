//
//  BottomView.m
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setViews];
    }
    return self;
}


- (void)setViews
{
    self.backgroundColor = [UIColor blackColor];
    UIImageView *cart = [[UIImageView alloc]initWithFrame:CGRectMake(10, 8, 30, 30)];
    cart.image = [UIImage imageNamed:@"cart.png"];
    [self addSubview:cart];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 13, 20, 20)];
    label.text = @"¥";
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 13, 80, 20)];
    _priceLabel.text = @"0";
    _priceLabel.textColor = [UIColor whiteColor];
    [self addSubview:_priceLabel];
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 0, 100, 46)];
    [_button setTitle:@"去结算" forState:UIControlStateNormal];
    _button.backgroundColor = RGBColor(233, 163, 52);
    [_button addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
    
}
-(void)pay
    {if ([self.delegate respondsToSelector:@selector(payWithTotalPrice:)]) {
        [self.delegate payWithTotalPrice:_priceLabel.text];
    }
}

@end
