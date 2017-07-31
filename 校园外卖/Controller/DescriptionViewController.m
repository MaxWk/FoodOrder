//
//  DescriptionViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "DescriptionViewController.h"
#import "BottomView.h"
#import "ScoreView.h"
#import "DescriptionView.h"
#import "CommentModel.h"
#import "CommentCell.h"
#import "PayViewController.h"

@interface DescriptionViewController ()<DescriptionViewDelegate,UITableViewDelegate,UITableViewDataSource,BottomViewDelegate>
@property(nonatomic,strong)BottomView *bottomView;
@property(nonatomic,strong) NSMutableArray *commentArr;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation DescriptionViewController

-(NSMutableArray *)commentArr
{
    if (!_commentArr) {
        CommentModel *model =[[CommentModel alloc]init];
        _commentArr = [model itemWithFoodName:_model.foodname];
    }
    return _commentArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商品详情";
    [self createCommentList];
    [self createBottomView];
}

- (void)createBottomView
{
    _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-110, SCREEN_WIDTH, 46)];
    _bottomView.delegate = self;
    [self.view addSubview:_bottomView];
    _bottomView.priceLabel.text = _price;
}
-(void)createCommentList
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-72) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - description delegate
- (void)addPricetoTotal:(int)price
{
    int nowPrice = [_bottomView.priceLabel.text intValue]+price;
    NSNumber *number = [NSNumber numberWithInt:nowPrice];
    _bottomView.priceLabel.text = [number stringValue];
}
- (void)minusPricetoTotal:(int)price
{
    if ([_bottomView.priceLabel.text intValue]>=price) {
        int nowPrice = [_bottomView.priceLabel.text intValue]-price;
        NSNumber *number = [NSNumber numberWithInt:nowPrice];
        _bottomView.priceLabel.text = [number stringValue];
    }
}
#pragma mark - tableview delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"commentcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"commentcell"];
    }
    cell.model = self.commentArr[indexPath.row];
    return cell;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0;
    }else if (section==1)
    {
        return self.commentArr.count;
    }else{
        return 0;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        DescriptionView *dv = [[DescriptionView alloc]init];
        dv.model = _model;
        dv.orderCount = _orderCount;
        dv.commmentCount = self.commentArr.count;
        dv.delegate = self;
        return dv;
    }
    else if (section==1)
    {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        headerView.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH, 20)];
        label.text = [NSString stringWithFormat:@"商品评价（%d）",self.commentArr.count];
        headerView.layer.borderWidth = 1;
        headerView.layer.borderColor = RGBColor(238, 238, 238).CGColor;
        [headerView addSubview:label];
        return headerView;
    }else
    {
    return nil;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 330;
    }
    else if (section==1)
    {
        return 40;
    }
    else
    {
    return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)payWithTotalPrice:(NSString *)totalPrice
{
    PayViewController *pc = [[PayViewController alloc]init];
    pc.price = totalPrice;
    [self.navigationController pushViewController:pc animated:YES];
}


@end
