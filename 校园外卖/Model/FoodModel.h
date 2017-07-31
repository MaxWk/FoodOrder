//
//  FoodModel.h
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodModel : NSObject

@property(nonatomic,copy) NSString *shopname;
@property(nonatomic,copy) NSString *foodname;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *picture;
@property(nonatomic,assign) int score;
@property(nonatomic,assign) int price;
@property(nonatomic,assign) int saled;

-(NSMutableArray *)foodList;
-(NSMutableArray *)itemWithShopName:(NSString *)shopName;

@end
