//
//  collectionModel.h
//  校园外卖
//
//  Created by MAX_W on 16/5/15.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collectionModel : NSObject

@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * icon;
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
