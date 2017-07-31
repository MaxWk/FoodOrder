//
//  CartViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/6/1.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "CartViewController.h"
#import "BottomView.h"
#import "CartCell.h"
#import "PayViewController.h"

@interface CartViewController ()<BottomViewDelegate,UITableViewDelegate,UITableViewDataSource,CartCellDelegate>;

@property(nonatomic,strong) BottomView *bottomView;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    [self initBottoView];
    [self initTableView];
}
- (void)initBottoView
{
    _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-110, SCREEN_WIDTH, 46)];
    _bottomView.delegate = self;
    [self.view addSubview:_bottomView];
}
- (void)initTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    _tableView.backgroundColor = RGBColor(238, 238, 238);
    [self.view addSubview:_tableView];
}
-(void)payWithTotalPrice:(NSString *)totalPrice
{
    PayViewController *pc = [[PayViewController alloc]init];
    pc.price = totalPrice;
    [self.navigationController pushViewController:pc animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 122;
}
-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartcell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CartCell" bundle:nil] forCellReuseIdentifier:@"cartcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cartcell"];
    }
    cell.delegate = self;
    return cell;
}

- (void)addPrice:(int)price
{
    int nowPrice = [_bottomView.priceLabel.text intValue]+price;
    NSNumber *number = [NSNumber numberWithInt:nowPrice];
    _bottomView.priceLabel.text = [number stringValue];
}
- (void)minusPrice:(int)price
{
    if ([_bottomView.priceLabel.text intValue]>=price) {
        int nowPrice = [_bottomView.priceLabel.text intValue]-price;
        NSNumber *number = [NSNumber numberWithInt:nowPrice];
        _bottomView.priceLabel.text = [number stringValue];
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

@end
