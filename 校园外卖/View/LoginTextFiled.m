//
//  LoginTextFiled.m
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "LoginTextFiled.h"

@implementation LoginTextFiled
- (instancetype)initWithFrame:(CGRect)frame leftImage:(NSString *)leftImage
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:leftImage]];
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.8].CGColor;
        self.layer.borderWidth =1.5;
        self.layer.cornerRadius = 6;
        self.keyboardType = UIKeyboardTypeAlphabet;
        self.textColor = [UIColor whiteColor];
    }
    return self;
}

- (CGRect)borderRectForBounds:(CGRect)bounds
{
    bounds.size.height = 44;
    return bounds;
}
-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.size = CGSizeMake(25, 25);
    iconRect.origin.x += 5;
    return iconRect;
}
@end
