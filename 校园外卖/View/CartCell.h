//
//  CartCell.h
//  校园外卖
//
//  Created by MAX_W on 16/6/1.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CartCellDelegate <NSObject>
@required
- (void)addPrice:(int)price;
- (void)minusPrice:(int)price;

@end

@interface CartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkBtn;

@property(nonatomic,assign) BOOL select;
@property(nonatomic,weak) id <CartCellDelegate> delegate;
@end
