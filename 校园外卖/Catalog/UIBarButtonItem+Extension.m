//
//  UIBarButtonItem+Extension.m

//
//  Created by MAX_W on 16/2/12.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImage:(NSString *)normalImage highlight:(NSString *)highlightImage  target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    CGRect frame = button.frame;
    frame.size.width = button.currentBackgroundImage.size.width;
    frame.size.height = button.currentBackgroundImage.size.width;
    button.frame = frame;
    [button addTarget:target action:action forControlEvents:
     UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}
+ (UIBarButtonItem *)itemWithtTitle:(NSString *)title  target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:
     UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.size = CGSizeMake(50, 30);
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}


@end
