//
//  SeondCell.m
//  校园外卖
//
//  Created by MAX_W on 16/5/21.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "SecondCell.h"

@implementation SecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_checkButton setImage:[UIImage imageNamed:@"check_highlight.png"] forState:UIControlStateSelected];
    _select = NO;
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}

- (IBAction)buttonClick:(id)sender {
    if (_select) {
        _checkButton.selected = NO;
        _select = NO;
    }else
    {
        _checkButton.selected = YES;
        _select = YES;
    }

}
@end
