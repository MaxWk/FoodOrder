//
//  FoodModel.m
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel
//表名
+(NSString *)getTableName
{
    return @"foodlist";
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

-(NSMutableArray *)foodList
{
    NSMutableArray * array = [FoodModel searchWithWhere:nil orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (FoodModel * sub in array) {
        if ([sub.foodname length]!=0) {
            if ([sub.foodname length]!=0) {
                [temp addObject:sub];
            }else{
                [temp1 addObject:sub];
            }
        }
    }
    [temp addObjectsFromArray:temp1];
    return temp;
}

-(NSMutableArray *)itemWithShopName:(NSString *)shopName
{
    NSMutableArray * array = [FoodModel searchWithWhere:[NSString stringWithFormat:@"shopname = '%@'",shopName] orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (FoodModel * sub in array) {
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
