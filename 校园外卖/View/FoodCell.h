//
//  FoodCell.h
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodModel.h"
#import "ScoreView.h"
@class FoodCell;
@protocol FoodCellDelegate <NSObject>
@required
-(void)FoodCell:(FoodCell *)cell addPricetoTotal:(int)price;
-(void)FoodCell:(FoodCell *)cell minusPricetoTotal:(int)price;

@end
@interface FoodCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *saledLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property(nonatomic,strong) ScoreView *scoreView;
- (IBAction)add:(id)sender;
- (IBAction)minus:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property(nonatomic,strong) FoodModel *model;
@property(nonatomic,weak) id<FoodCellDelegate>delegate;

@end
