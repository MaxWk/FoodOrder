//
//  shopModel.h
//  校园外卖
//
//  Created by MAX_W on 16/5/16.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopModel : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *imagepath;
@property(nonatomic,assign) int type;


-(NSMutableArray *)shopList;
-(NSMutableArray *)itemType:(int)type;
-(NSMutableArray *)itemName:(NSString *)name;

@end
