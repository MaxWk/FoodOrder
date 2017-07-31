//
//  TakeoutViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/14.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "TakeoutViewController.h"
#import "HeadView.h"
#import "CollectionViewCell.h"
#import "collectionModel.h"
#import "shopModel.h"
#import "TakeoutFirstSectionCell.h"
#import "LocationView.h"
#import "DetailsViewController.h"
#import "ClassifyViewController.h"
#import "SearchViewController.h"

@interface TakeoutViewController ()<CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic,strong) UIButton *searchBar;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *tableDataSource;
@property(nonatomic,strong) NSMutableArray *collectionDataSource;
@property(nonatomic,strong) LocationView * locationView;
@end

@implementation TakeoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    [_locationManager requestAlwaysAuthorization];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    [self setUpSearchBar];
    [self setUpTableView];
    [self setUpLocationView];

}
- (void)setUpLocationView
{
    _locationView = [[LocationView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    [_locationView setImage:[UIImage imageNamed:@"location.png"] forState:UIControlStateNormal];
    [_locationView setTitle:@"定位中..." forState:UIControlStateNormal];
    self.navigationItem.titleView = _locationView;
    [_locationView addTarget:self action:@selector(location) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setUpSearchBar
{
    self.searchBar = [[UIButton alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,44.0f)];
    [_searchBar setImage:[UIImage imageNamed:@"searchbar.png"] forState:UIControlStateNormal];
    [_searchBar setImage:[UIImage imageNamed:@"searchbar.png"] forState:UIControlStateHighlighted];
    [_searchBar addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchBar];

}
-(void)setUpTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44.0f, SCREEN_WIDTH, SCREEN_HEIGHT-44.0f-60.0f) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - 定位代理
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status)
    {
        case kCLAuthorizationStatusNotDetermined:
            break;
            
        case kCLAuthorizationStatusRestricted:
            break;
            
        case kCLAuthorizationStatusDenied:
            return;
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
            [_locationManager startUpdatingLocation];
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [_locationManager startUpdatingLocation];
            break;
            
        default:
            break;
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    CLLocation *lastLocation = locations[locations.count-1];
    [_locationManager stopUpdatingLocation];
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:lastLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count == 0)
            return;
        
        for (CLPlacemark *placemark in placemarks)
        {
            NSString *location = [NSString stringWithFormat:@"%@",placemark.name];
            [_locationView setTitle:location forState:UIControlStateNormal];
        }
        
    }];
}
#pragma mark - 懒加载
-(NSMutableArray *)tableDataSource
{
    if (!_tableDataSource) {
        shopModel *Model = [shopModel new];
        _tableDataSource = [Model shopList];
    }
    return _tableDataSource;
}

-(NSMutableArray *)collectionDataSource
{
    if (!_collectionDataSource) {
        _collectionDataSource = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"collection.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *tmp in arr) {
            collectionModel *model = [collectionModel modelWithDict:tmp];
            [_collectionDataSource addObject:model];
        }

    }
    return _collectionDataSource;
}

#pragma mark - tableview代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 0;
    }else{
        return self.tableDataSource.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TakeoutFirstSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell"];
    if (cell == nil) {
        cell = [[TakeoutFirstSectionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tablecell"];
    }
    shopModel *model = self.tableDataSource[indexPath.row];
    cell.shopImage.image = [UIImage imageNamed:model.imagepath];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        HeadView *firstHeadView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80) Arr:@[@"ads1",@"ads1"]];
        return firstHeadView;
    }else{
        return nil;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==0) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170) collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor=[UIColor whiteColor];
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectioncell"];
        
        CGFloat marginH = (SCREEN_WIDTH-50*4)/4.0;
        CGFloat marginV = 10;
        flowLayout.itemSize=CGSizeMake(50,70);
        flowLayout.minimumInteritemSpacing=marginH;
        flowLayout.minimumLineSpacing=marginV;
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset=UIEdgeInsetsMake(marginV, marginH/2.0, marginV, marginH/2.0);
        return collectionView;
    }
    else
    {
        return nil;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 80;
    }else{
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 170;
    }else{
    return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *dvc = [[DetailsViewController alloc]init];
    shopModel * model = _tableDataSource[indexPath.row];
    dvc.navigationItem.title = model.name;
    [self.navigationController pushViewController:dvc animated:YES];
}
#pragma mark - collectionview代理
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectioncell" forIndexPath:indexPath];
    collectionModel *model = self.collectionDataSource[indexPath.item];
    cell.iconImageView.image = [UIImage imageNamed:model.icon];
    cell.titleLabel.text = model.title;
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClassifyViewController *cvc = [[ClassifyViewController alloc]init];
    collectionModel *CM = self.collectionDataSource[indexPath.item];
    cvc.navigationItem.title = CM.title;
    shopModel *model = [[shopModel alloc]init];
    cvc.shopArr = [model itemType:indexPath.row+1];
    if (cvc.shopArr.count == 0) {
        [MBProgressHUD showError:@"暂无商家入驻，敬请期待"];
        
    }else{
        [self.navigationController pushViewController:cvc animated:YES];
    }
}


-(void)location
{
    
}
-(void)search
{
    SearchViewController *svc = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
}

@end
