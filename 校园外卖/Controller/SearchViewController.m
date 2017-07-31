//
//  SearchViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/29.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "SearchViewController.h"
#import "TakeoutFirstSectionCell.h"
#import "shopModel.h"
#import "DetailsViewController.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UISearchBar *searchBar;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"请输入商家或商品名称";
    self.navigationItem.titleView = _searchBar;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
}
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        shopModel *model = [[shopModel alloc]init];
        _dataSource = [model itemName:@""];
    }
    return _dataSource;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    shopModel *model = [[shopModel alloc]init];
    _dataSource = [model itemName:searchBar.text];
    [_tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TakeoutFirstSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell"];
    if (cell == nil) {
        cell = [[TakeoutFirstSectionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tablecell"];
    }
    shopModel *model = self.dataSource[indexPath.row];
    cell.shopImage.image = [UIImage imageNamed:model.imagepath];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
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
    shopModel * model = _dataSource[indexPath.row];
    dvc.navigationItem.title = model.name;
    [self.navigationController pushViewController:dvc animated:YES];
}




@end
