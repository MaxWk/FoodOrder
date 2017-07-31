//
//  ClassifyViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/19.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "ClassifyViewController.h"
#import "shopModel.h"
#import "TakeoutFirstSectionCell.h"
#import "DetailsViewController.h"

@interface ClassifyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;

@end

@implementation ClassifyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TakeoutFirstSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell"];
    if (cell == nil) {
        cell = [[TakeoutFirstSectionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tablecell"];
    }
    shopModel *model = self.shopArr[indexPath.row];
    cell.shopImage.image = [UIImage imageNamed:model.imagepath];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shopArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *dvc = [[DetailsViewController alloc]init];
    shopModel * model = _shopArr[indexPath.row];
    dvc.navigationItem.title = model.name;
    [self.navigationController pushViewController:dvc animated:YES];
}



@end
