//
//  TakeoutFirstSectionCell.m
//  校园外卖
//
//  Created by MAX_W on 16/5/14.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "TakeoutFirstSectionCell.h"

@implementation TakeoutFirstSectionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _shopImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        [self.contentView addSubview:_shopImage];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}

@end
