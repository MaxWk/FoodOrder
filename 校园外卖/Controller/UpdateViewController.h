//
//  UpdateViewController.h
//  校园外卖
//
//  Created by MAX_W on 16/5/30.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface UpdateViewController : UIViewController

@property(nonatomic,strong) UserModel *model;
@property(nonatomic,copy) NSString *messager;
@property(nonatomic,strong) UITextField *textFiled;

@end
