//
//  CommentModel.h
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property(nonatomic,copy) NSString *foodname;
@property(nonatomic,copy) NSString *username;
@property(nonatomic,assign) int score;
@property(nonatomic,copy) NSString *time;
@property(nonatomic,copy) NSString *content;

-(NSMutableArray *)itemWithFoodName:(NSString *)foodName;

@end
