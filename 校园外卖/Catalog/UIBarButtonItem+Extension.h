//
//  UIBarButtonItem+Extension.h

//
//  Created by MAX_W on 16/2/12.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImage:(NSString *)normalImage highlight:(NSString *)highlightImage  target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithtTitle:(NSString *)title  target:(id)target action:(SEL)action;

@end
