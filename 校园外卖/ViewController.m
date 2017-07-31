//
//  ViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/14.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"
#import "LoginTextFiled.h"
#import "UserModel.h"

@interface ViewController ()
@property (strong, nonatomic)  LoginTextFiled *userNameFlied;
@property (strong, nonatomic)  LoginTextFiled *passWordFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameFlied = [[LoginTextFiled alloc]initWithFrame:CGRectMake(60, 150, 200, 35) leftImage:@"username.png"];
    [self.view addSubview:_userNameFlied];
    _passWordFiled = [[LoginTextFiled alloc]initWithFrame:CGRectMake(60, 200, 200, 35) leftImage:@"password.png"];
    _passWordFiled.secureTextEntry = YES;
    [self.view addSubview:_passWordFiled];
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 270, 200, 40)];
    loginButton.layer.cornerRadius = 8;
    [loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor orangeColor];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (void)login
{
//    UserModel *model = [[UserModel alloc]init];
//    NSMutableArray *arr = [model itemWithUserId:_userNameFlied.text password:_passWordFiled.text];
//    if(arr.count){
//        TabBarViewController *tabbar = [[TabBarViewController alloc]init];
//        [self presentViewController:tabbar animated:NO completion:nil];
//    }else
//    {
//        [MBProgressHUD showError:@"用户名或密码错误"];
//
//    }
    TabBarViewController *tabbar = [[TabBarViewController alloc]init];
    [self presentViewController:tabbar animated:NO completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_userNameFlied resignFirstResponder];
    [_passWordFiled resignFirstResponder];
}

@end
