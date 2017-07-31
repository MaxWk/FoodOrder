//
//  UserModel.m
//  校园外卖
//
//  Created by MAX_W on 16/5/21.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
+(NSString *)getTableName
{
    return @"userlist";
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

-(NSMutableArray *)itemWithUserId:(NSString *)userid
{
    NSMutableArray * array = [UserModel searchWithWhere:[NSString stringWithFormat:@"user_id = '%@'",userid] orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (UserModel * sub in array) {
        if ([sub.user_id length]!=0) {
            if ([sub.user_id  length]!=0) {
                [temp addObject:sub];
            }else{
                [temp1 addObject:sub];
            }
        }
    }
    [temp addObjectsFromArray:temp1];
    return temp;
}
-(NSMutableArray *)itemWithUserId:(NSString *)userid password:(NSString *)password
{
    NSMutableArray * array = [UserModel searchWithWhere:[NSString stringWithFormat:@"user_id = '%@' and password = '%@'",userid,password] orderBy:nil offset:0 count:0];
    NSMutableArray * temp = [NSMutableArray new];
    NSMutableArray * temp1 = [NSMutableArray new];
    for (UserModel * sub in array) {
        if ([sub.user_id length]!=0) {
            if ([sub.user_id  length]!=0) {
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
