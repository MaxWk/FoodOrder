//
//  ScoreView.m
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "ScoreView.h"

@implementation ScoreView


//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setStars];
//    }
//    return self;
//}
-(void)setScore:(int)score
{
    _score = score;
    for (int i = 0;i < 5;i ++) {
        UIImageView *star = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.height, 0 , self.height, self.height)];
        if (i<score) {
            star.image = [UIImage imageNamed:@"star_highlight"];
        }else{
            star.image = [UIImage imageNamed:@"star_normal.png"];
        }
        [self addSubview:star];
    }
}

@end
