//
//  DecriptionView.h
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreView.h"
#import "FoodModel.h"
@protocol  DescriptionViewDelegate <NSObject>
@required
-(void)addPricetoTotal:(int)price;
-(void)minusPricetoTotal:(int)price;

@end
@interface DescriptionView : UIView

@property(nonatomic,assign) int commmentCount;
@property(nonatomic,copy) NSString *orderCount;
@property(nonatomic,strong) FoodModel *model;
@property(nonatomic,weak) id<DescriptionViewDelegate>delegate;

@end
