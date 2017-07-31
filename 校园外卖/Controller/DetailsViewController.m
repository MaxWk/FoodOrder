//
//  DetailsViewController.m
//  yileDemo
//
//  Created by ChenYi on 15/12/16.
//  Copyright © 2015年 ChenYi. All rights reserved.
//

#import "DetailsViewController.h"
#import "LeftSelectScroll.h"
#import "FoodCell.h"
#import "FoodModel.h"
#import "BottomView.h"
#import "DescriptionViewController.h"
#import "PayViewController.h"

@interface DetailsViewController ()<LeftSelectScrollDelegate,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,FoodCellDelegate,BottomViewDelegate>
{
    LeftSelectScroll *leftScrollView;
    
    NSMutableArray *leftDataSource;
    
    //当点击的时候 不去调用滑动调节
    BOOL isScrollSetSelect;
    
    UITableView *tableViewList;

}
@property(nonatomic,strong) NSMutableArray *foodDataSource;
@property(nonatomic,strong) BottomView *bottomView;
@end

@implementation DetailsViewController
-(NSMutableArray *)foodDataSource
{
    if (!_foodDataSource) {
        FoodModel *model = [[FoodModel alloc]init];
        _foodDataSource = [model itemWithShopName:self.navigationItem.title];
        if(_foodDataSource.count==0)
        {
            _foodDataSource = [model foodList];
        }
    }
    
    return _foodDataSource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initObjects];
    [self creatLeftScrollView];
    [self createTableView];
    [self createBottomView];
}

-(void)initObjects{
    leftDataSource = [[NSMutableArray alloc]initWithObjects:@"套餐1",@"套餐2",@"套餐3",@"套餐4", nil];

}
-(void)createTableView{
    tableViewList = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftScrollView.frame), 0, kScreenWidth*0.75, SCREEN_HEIGHT-110)];
    tableViewList.delegate = self;
    tableViewList.dataSource = self;
    tableViewList.tag = 21;//标识tableView
    [self.view addSubview:tableViewList];
    tableViewList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    tableViewList.scrollEnabled = YES;
}
-(void)creatLeftScrollView{
    
    leftScrollView = [[LeftSelectScroll alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth*0.25,SCREEN_HEIGHT)];
    
    leftScrollView.backgroundColor = RGBColor(238, 238, 238);
    
    [leftScrollView setLeftSelectArray:leftDataSource];
    
    leftScrollView.leftSelectDelegate = self;
    
    leftScrollView.delegate = self;
    
    [self.view addSubview:leftScrollView];
}
-(void)createBottomView
{
    _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-110, SCREEN_WIDTH, 46)];
    _bottomView.delegate = self;
    [self.view addSubview:_bottomView];
}

#pragma mark 点击左侧切换右侧的代理方法
-(void)clickLeftSelectScrollButton:(NSInteger)indexPath{

    isScrollSetSelect = NO;
    
    [tableViewList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView.tag == 21) {
        if (isScrollSetSelect == YES) {
            [leftScrollView setSelectButtonWithIndexPathSection:section];
        }
        return [self viewForHeaderView:section];
    }else{
        return nil;
    }
}


//实际需要会修改
-(UIView*)viewForHeaderView:(NSInteger)parama{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 32)];
    label.backgroundColor = RGBColor(238, 238, 238);
    if (leftDataSource.count != 0) {
        label.text = leftDataSource[parama];
    }
    return label;
}
#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return  leftDataSource.count ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.foodDataSource.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodcel"];
    
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"FoodCell" bundle:nil] forCellReuseIdentifier:@"foodcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"foodcell"];
    }
    FoodModel *model = self.foodDataSource[indexPath.row];
    cell.model = model;
    cell.delegate = self;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DescriptionViewController *des = [[DescriptionViewController alloc]init];
    FoodModel *model = self.foodDataSource[indexPath.row];
    des.model = model;
    des.price = _bottomView.priceLabel.text;
    FoodCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    des.orderCount = cell.countLabel.text;
    [self.navigationController  pushViewController:des animated:YES];
}
#pragma mark - foodcelldelegate
-(void)FoodCell:(FoodCell *)cell addPricetoTotal:(int)price
{
    int nowPrice = [_bottomView.priceLabel.text intValue]+price;
    NSNumber *number = [NSNumber numberWithInt:nowPrice];
    _bottomView.priceLabel.text = [number stringValue];
    
}
-(void)FoodCell:(FoodCell *)cell minusPricetoTotal:(int)price
{
    if ([_bottomView.priceLabel.text intValue]>=price) {
        int nowPrice = [_bottomView.priceLabel.text intValue]-price;
        NSNumber *number = [NSNumber numberWithInt:nowPrice];
        _bottomView.priceLabel.text = [number stringValue];
    }
}



-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isScrollSetSelect = YES ;
}



-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}
-(void)payWithTotalPrice:(NSString *)totalPrice
{
    PayViewController *pc = [[PayViewController alloc]init];
    pc.price = totalPrice;
    [self.navigationController pushViewController:pc animated:YES];
}

@end
