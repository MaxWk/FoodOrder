//
//  CartCell.m
//  校园外卖
//
//  Created by MAX_W on 16/6/1.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "CartCell.h"

@interface CartCell()
- (IBAction)check:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *margin;

@end
@implementation CartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_checkBtn setImage:[UIImage imageNamed:@"check_highlight.png"] forState:UIControlStateSelected];
    _select = NO;
    _margin.backgroundColor = RGBColor(238, 238, 238);
}

- (IBAction)check:(id)sender {
    if (_select) {
        _checkBtn.selected = NO;
        _select = NO;
        if ([self.delegate respondsToSelector:@selector(minusPrice:)]) {
            [self.delegate minusPrice:_priceLabel.text.intValue];
        }
    }else
    {
        _checkBtn.selected = YES;
        _select = YES;
        if ([self.delegate respondsToSelector:@selector(addPrice:)]) {
            [self.delegate addPrice:_priceLabel.text.intValue];
        }
    }

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}
@end
