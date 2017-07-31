//
//  FoodCell.m
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "FoodCell.h"
@implementation FoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _scoreView = [[ScoreView alloc]initWithFrame:CGRectMake(82, 42, 75, 15)];
    [self.contentView addSubview:_scoreView];
}

-(void)setModel:(FoodModel *)model
{
    _model = model;
    _iconImageView.image = [UIImage imageNamed:model.icon];
    _nameLabel.text = model.foodname;
    _saledLabel.text = [NSString stringWithFormat:@"月售%d份",model.saled];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %d",model.price];
    _scoreView.score = model.score;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}
- (IBAction)add:(id)sender {
    int count =  [_countLabel.text intValue]+1;
    NSNumber *number = [NSNumber numberWithInt:count];
    _countLabel.text = [number stringValue];
    if ([self.delegate respondsToSelector:@selector(FoodCell:addPricetoTotal:)]) {
        [self.delegate FoodCell:self addPricetoTotal:_model.price];
    }
}

- (IBAction)minus:(id)sender {
    if ([_countLabel.text integerValue]>=1) {
        int count =  [_countLabel.text intValue]-1;
        NSNumber *number = [NSNumber numberWithInt:count];
        _countLabel.text = [number stringValue];
        if ([self.delegate respondsToSelector:@selector(FoodCell:minusPricetoTotal:)]) {
            [self.delegate FoodCell:self minusPricetoTotal:_model.price];
        }
    }    
}
@end
