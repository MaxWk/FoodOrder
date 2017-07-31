//
//  ProfileViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/22.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "ProfileViewController.h"
#import "UserModel.h"
#import "ViewController.h"
#import "UpdateViewController.h"


@interface ProfileViewController ()<UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *logout;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressCount;
@property (weak, nonatomic) IBOutlet UILabel *phone;
- (IBAction)logout:(id)sender;
- (IBAction)UpdateIcon:(id)sender;
- (IBAction)UpdateName:(id)sender;
- (IBAction)UpdateAddress:(id)sender;
@property(nonatomic,strong) UserModel *user;
@end

@implementation ProfileViewController
- (IBAction)logout:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)UpdateIcon:(id)sender {
    
}

- (IBAction)UpdateName:(id)sender {
    UpdateViewController *uvc = [[UpdateViewController alloc]init];
    uvc.model = self.user;
    uvc.messager = @"用户名";
    [self.navigationController pushViewController:uvc animated:YES];
}

- (IBAction)UpdateAddress:(id)sender {

}

- (IBAction)UpdatePhone:(id)sender {
    UpdateViewController *uvc = [[UpdateViewController alloc]init];
    uvc.model = self.user;
    uvc.messager = @"联系方式";
    [self.navigationController pushViewController:uvc animated:YES];
}

- (IBAction)UpdatePwd:(id)sender {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _logout.layer.cornerRadius = 6;

}
-(void)viewWillAppear:(BOOL)animated
{
    UserModel *tmp = [[UserModel alloc]init];
    NSMutableArray *arr = [tmp itemWithUserId:@"1206040610"];
    _user = [arr firstObject];
    _nameLabel.text = self.user.name;
    _phone.text = self.user.phone;
}


@end
