//
//  collectionModel.m
//  校园外卖
//
//  Created by MAX_W on 16/5/15.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "collectionModel.h"

@implementation collectionModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
    }
    return self;
}


@end
