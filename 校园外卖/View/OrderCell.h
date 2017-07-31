//
//  OrderCell.h
//  校园外卖
//
//  Created by MAX_W on 16/5/30.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell

@property(nonatomic,assign) BOOL isJudged;
@property (weak, nonatomic) IBOutlet UIButton *judgeButton;

@end
