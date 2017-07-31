//
//  DecriptionView.m
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "DescriptionView.h"

@interface DescriptionView ()

@property(nonatomic,strong) UIImageView *pictureView;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) ScoreView *scoreView;
@property(nonatomic,strong) UILabel *cmtCountLabel;
@property(nonatomic,strong) UILabel *saledCountLabel;
@property(nonatomic,strong) UILabel *priceLabel;
@property(nonatomic,strong) UILabel *countLabel;

@end

@implementation DescriptionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 330);
        self.backgroundColor = [UIColor whiteColor];
        _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 219)];
        [self addSubview:_pictureView];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 220, SCREEN_WIDTH, 42)];
        _nameLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_nameLabel];
        _scoreView = [[ScoreView alloc]initWithFrame:CGRectMake(8, 262, 100, 20)];
        [self addSubview:_scoreView];
        _cmtCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(115,262,80, 21)];
        _cmtCountLabel.textColor = [UIColor grayColor];
        [self addSubview:_cmtCountLabel];
        _saledCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 262, 90, 21)];
        _saledCountLabel.textColor = [UIColor grayColor];
        [self addSubview:_saledCountLabel];
        UILabel *RMB = [[UILabel alloc]initWithFrame:CGRectMake(8, 307, 10, 10)];
        RMB.textColor = [UIColor orangeColor];
        RMB.font = [UIFont systemFontOfSize:15];
        RMB.text = @"¥";
        [self addSubview:RMB];
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 293, 60, 35)];
        _priceLabel.textColor = [UIColor orangeColor];
        _priceLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_priceLabel];
        UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-55, 293, 25, 25)];
        [add setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
        [add addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:add];
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-95, 293, 40, 25)];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.font = [UIFont systemFontOfSize:20];
        _countLabel.text = @"0";
        [self addSubview:_countLabel];
        UIButton *minus = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-120, 293, 25, 25)];
        [minus setImage:[UIImage imageNamed:@"minus.png"] forState:UIControlStateNormal];
        [minus addTarget:self action:@selector(minus) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:minus];

    }
    return self;
}


-(void)setCommmentCount:(int)commmentCount
{
    _commmentCount = commmentCount;
    _cmtCountLabel.text = [NSString stringWithFormat:@"%d个评价",commmentCount];
}
-(void)setOrderCount:(NSString *)orderCount
{
    _orderCount = orderCount;
    _countLabel.text = orderCount;
}

-(void)setModel:(FoodModel *)model
{
    _model = model;
    _pictureView.image = [UIImage imageNamed:model.picture];
    _nameLabel.text = model.foodname;
    _scoreView.score = model.score;
    _saledCountLabel.text = [NSString stringWithFormat:@"月售%d份",model.saled];
    _priceLabel.text = [NSString stringWithFormat:@"%d",model.price];

}
-(void)add
{
    int count =  [_countLabel.text intValue]+1;
    NSNumber *number = [NSNumber numberWithInt:count];
    _countLabel.text = [number stringValue];
    if ([self.delegate respondsToSelector:@selector(addPricetoTotal:)]) {
        [self.delegate addPricetoTotal:_model.price];
    }
}
-(void)minus
{   if([_countLabel.text intValue]>=1){
        int count =  [_countLabel.text intValue]-1;
        NSNumber *number = [NSNumber numberWithInt:count];
        _countLabel.text = [number stringValue];
        if ([self.delegate respondsToSelector:@selector(minusPricetoTotal:)]) {
            [self.delegate minusPricetoTotal:_model.price];
        }
    }
}


@end
