//
//  SeondCell.h
//  校园外卖
//
//  Created by MAX_W on 16/5/21.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCell : UITableViewCell
@property(nonatomic,assign) BOOL select;
@property (weak, nonatomic) UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
- (IBAction)buttonClick:(id)sender;

@end
