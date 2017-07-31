//
//  PayViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/21.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "PayViewController.h"
#import "FirstCell.h"
#import "SecondCell.h"
#import "ThirdCell.h"
#import "ForthCell.h"
#import "BottomView.h"
#import "UserModel.h"

@interface PayViewController ()<BottomViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UserModel *user;
@property(nonatomic,strong) BottomView *bottomView;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation PayViewController
-(UserModel *)user
{
    if (!_user) {
        UserModel *tmp = [[UserModel alloc]init];
        NSMutableArray *arr = [tmp itemWithUserId:@"1206040610"];
        _user = [arr firstObject];
    }
    return _user;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确定订单";
    [self createTableView];
    [self createBottomView];
}

- (void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
- (void)createBottomView
{
    _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-110, SCREEN_WIDTH, 46)];
    _bottomView.delegate = self;
    [_bottomView.button setTitle:@"确认下单" forState:UIControlStateNormal];
    [self.view addSubview:_bottomView];
    _bottomView.priceLabel.text = _price;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 1;
        case 3:
            return 2;
        default:
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section==0) {
        FirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstcell"];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellReuseIdentifier:@"firstcell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"firstcell"];
        }
        cell.nameLabel.text = self.user.name;
        cell.phoneLabel.text = self.user.phone;
        cell.addressLabel.text = self.user.address;
        return cell;
    }else if(indexPath.section==1)
    {
        if (indexPath.row) {
            SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondcell"];
            if (!cell)
            {
                [tableView registerNib:[UINib nibWithNibName:@"SecondCell" bundle:nil] forCellReuseIdentifier:@"secondcell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"secondcell"];
            }
            return cell;
        }else
        {
            SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondcell"];
            if (!cell)
            {
                [tableView registerNib:[UINib nibWithNibName:@"SecondCell" bundle:nil] forCellReuseIdentifier:@"secondcell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"secondcell"];
            }
            cell.textLabel.text = @"在线支付";
            return cell;
            
        }

    }else if(indexPath.section==2)
    {
        ThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thirdcell"];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"ThirdCell" bundle:nil] forCellReuseIdentifier:@"thirdcell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"thirdcell"];
        }
        cell.input.delegate = self;
        return cell;
    }else
    {
        if (indexPath.row) {
            ForthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"forthcell"];
            if (!cell)
            {
                [tableView registerNib:[UINib nibWithNibName:@"ForthCell" bundle:nil] forCellReuseIdentifier:@"forthcell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"forthcell"];
            }
            cell.nameLabel.text = @"配送费";
            cell.priceLabel.text = @"¥0";
            cell.countLabel.text = nil;
            return cell;
        }else{
            ForthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"forthcell"];
            if (!cell)
            {
                [tableView registerNib:[UINib nibWithNibName:@"ForthCell" bundle:nil] forCellReuseIdentifier:@"forthcell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"forthcell"];
            }
            return cell;
            
        }
    }
    
  
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 80;
        case 1:
            return 50;
        case 2:
            return 100;
        default:
            return 46;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{   if(section==3){
        return 0;
    }else
    {
        return 20;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        SecondCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.select) {
            cell.checkButton.selected = NO;
            cell.select = NO;
        }else
        {
            cell.checkButton.selected = YES;
            cell.select = YES;
        }
    }

}
-(void)payWithTotalPrice:(NSString *)totalPrice
{
    NSLog(@"%@",totalPrice);
}
-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _tableView.contentOffset = CGPointMake(0, 80);
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _tableView.contentOffset = CGPointMake(0, 80);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
