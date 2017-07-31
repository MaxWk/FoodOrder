//
//  OrderCell.m
//  校园外卖
//
//  Created by MAX_W on 16/5/30.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "OrderCell.h"

@interface OrderCell()
@property (weak, nonatomic) IBOutlet UIView *margin;


@end

@implementation OrderCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.judgeButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.judgeButton.layer.cornerRadius = 5;
    self.judgeButton.layer.borderWidth = 1;
    self.margin.backgroundColor = RGBColor(238, 238, 238);
    self.margin.userInteractionEnabled = NO;
    _isJudged = YES;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}

@end
