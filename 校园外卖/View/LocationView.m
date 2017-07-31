//
//  LocationView.m
//  校园外卖
//
//  Created by MAX_W on 16/5/16.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "LocationView.h"

@implementation LocationView

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.y += 5;
    self.imageView.size = CGSizeMake(15, 20);
    self.titleLabel.font = [UIFont systemFontOfSize:15];
}

@end
