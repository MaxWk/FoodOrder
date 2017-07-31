//
//  UIImageView+roundness.m
//  01企业交流社区
//
//  Created by White on 16/4/8.
//  Copyright © 2016年 White. All rights reserved.
//

#import "UIImageView+roundness.h"

@implementation UIImageView (roundness)

- (void)roundness
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.width*.5;
    self.layer.borderWidth = 0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}
@end
