//
//  ThirdCell.m
//  校园外卖
//
//  Created by MAX_W on 16/5/21.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "ThirdCell.h"

@implementation ThirdCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _input = [[UITextField alloc]initWithFrame:CGRectMake(25, 35, self.width, 35)];
    _input.placeholder = @"口味等其他要求";
    _input.layer.borderWidth = 0;
    _input.layer.borderColor = [UIColor whiteColor].CGColor;
    [_input addTarget:self action:@selector(editchanged) forControlEvents:UIControlEventEditingChanged];
    [self.contentView addSubview:_input];

}
-(void)editchanged
{
    _label.text = [NSString stringWithFormat:@"%d/100",_input.text.length];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}

@end
