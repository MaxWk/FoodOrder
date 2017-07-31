//
//  shopModel.m
//  校园外卖
//
//  Created by MAX_W on 16/5/16.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "shopModel.h"

@implementation shopModel
//表名
+(NSString *)getTableName
{
    return @"shoplist";
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

-(NSMutableArray *)shopList
{
    NSMutableArray * array = [shopModel searchWithWhere:nil orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (shopModel * sub in array) {
        if ([sub.name length]!=0) {
            if ([sub.name length]!=0) {
                [temp addObject:sub];
            }else{
                [temp1 addObject:sub];
            }
        }
    }
    [temp addObjectsFromArray:temp1];
    return temp;
}

-(NSMutableArray *)itemType:(int)type
{
    NSMutableArray * array = [shopModel searchWithWhere:[NSString stringWithFormat:@"type = %d",type] orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (shopModel * sub in array) {
        if ([sub.name length]!=0) {
            if ([sub.name length]!=0) {
                [temp addObject:sub];
            }else{
                [temp1 addObject:sub];
            }
        }
    }
    [temp addObjectsFromArray:temp1];
    return temp;
}
-(NSMutableArray *)itemName:(NSString *)name
{
    NSMutableArray * array = [shopModel searchWithWhere:[NSString stringWithFormat:@"name like '%%%@%%'",name] orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (shopModel * sub in array) {
        if ([sub.name length]!=0) {
            if ([sub.name length]!=0) {
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
