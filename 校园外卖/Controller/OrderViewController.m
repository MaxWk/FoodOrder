//
//  OrderViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/14.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderCell.h"
#import "JudgeViewController.h"
#import "CartViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightButtonItem = [UIBarButtonItem itemWithImage:@"cart1.png" highlight:@"cart1.png" target:self action:@selector(cart)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordercell"];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"OrderCell" bundle:nil] forCellReuseIdentifier:@"ordercell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ordercell"];
    }
    if(indexPath.row)
    {
        cell.isJudged = NO;
    }
    if (cell.isJudged==NO) {
        [cell.judgeButton setTitle:@"未评价" forState:UIControlStateNormal];
        [cell.judgeButton addTarget:self action:@selector(judge) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}

- (void)judge
{
    JudgeViewController *jvc = [[JudgeViewController alloc]init];
    [self.navigationController pushViewController:jvc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 168;
}
- (void)cart
{
    CartViewController *cvc = [[CartViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];
}
@end
