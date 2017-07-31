//
//  CommentModel.m
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
+(NSString *)getTableName
{
    return @"commentlist";
}
//表版本
+(int)getTableVersion
{
    return 1;
}
+(NSString *)getPrimaryKey
{
    return nil;
}

-(NSMutableArray *)itemWithFoodName:(NSString *)foodName
{
    NSMutableArray * array = [CommentModel searchWithWhere:[NSString stringWithFormat:@"foodname = '%@'",foodName] orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (CommentModel * sub in array) {
        if ([sub.foodname length]!=0) {
            if ([sub.foodname  length]!=0) {
                [temp addObject:sub];
            }else{
                [temp1 addObject:sub];
            }
        }
    }
    [temp addObjectsFromArray:temp1];
    return temp;
}

@end
