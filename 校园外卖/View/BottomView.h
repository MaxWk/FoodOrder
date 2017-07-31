//
//  BottomView.h
//  校园外卖
//
//  Created by MAX_W on 16/5/17.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  BottomViewDelegate <NSObject>
@required
- (void)payWithTotalPrice:(NSString *)totalPrice;
@end


@interface BottomView : UIView
@property(nonatomic,strong) UILabel *priceLabel;
@property(nonatomic,strong) UIButton *button;
@property(nonatomic,weak) id<BottomViewDelegate>delegate;

@end
