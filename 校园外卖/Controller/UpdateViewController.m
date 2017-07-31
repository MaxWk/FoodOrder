//
//  UpdateViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/30.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "UpdateViewController.h"
#import "UserModel.h"


@interface UpdateViewController ()<UIAlertViewDelegate>
@property(nonatomic,strong) UserModel *updateModel;

@end

@implementation UpdateViewController


-(UserModel *)updateModel
{
    if (!_updateModel) {
        _updateModel = [UserModel new];
        _updateModel.user_id = self.model.user_id;
        _updateModel.name = self.model.name;
        _updateModel.password = self.model.password;
        _updateModel.phone = self.model.phone;
    }
    return _updateModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    _textFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH, 30)];
    _textFiled.backgroundColor = [UIColor whiteColor];
    _textFiled.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_textFiled];

    if([_messager isEqualToString:@"用户名"])
    {
        self.navigationItem.title = @"修改用户名";
        _textFiled.text = _model.name;
    }else{
        self.navigationItem.title = @"修改联系方式";
        _textFiled.text = _model.phone;
    }
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithtTitle:@"保存" target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = rightItem;
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithtTitle:@"取消" target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = leftItem;
    

    
}

- (void)save
{
    if([_messager isEqualToString:@"用户名"])
    {
        self.updateModel.name = _textFiled.text;
    }else{
        self.updateModel.phone = _textFiled.text;
    }
    [UserModel updateToDB:self.updateModel where:[NSString stringWithFormat:@"name = '%@'",_model.name]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)cancel
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您尚未保存，确认退出吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}





-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

@end
