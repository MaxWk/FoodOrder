//
//  CommentCell.m
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "CommentCell.h"
#import "ScoreView.h"

@interface CommentCell ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(nonatomic,strong) ScoreView *scoreView;
@end
@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _scoreView = [[ScoreView alloc]initWithFrame:CGRectMake(10, 10, 75, 15)];
    [self.contentView addSubview:_scoreView];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}
-(void)setModel:(CommentModel *)model
{
    _scoreView.score = model.score;
    _timeLabel.text = model.time;
    _userNameLabel.text = model.username;
    _contentLabel.text = model.content;
}

@end
