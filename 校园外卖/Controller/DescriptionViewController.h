//
//  DescriptionViewController.h
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodModel.h"

@interface DescriptionViewController : UIViewController
@property(nonatomic,copy) NSString *price;
@property(nonatomic,strong)FoodModel *model;
@property(nonatomic,copy) NSString *orderCount;


@end
