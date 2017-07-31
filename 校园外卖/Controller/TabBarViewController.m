//
//  TabBarViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/14.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "TabBarViewController.h"
#import "MainNavigationController.h"
#import "TakeoutViewController.h"
#import "OrderViewController.h"
#import "ProfileViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

+ (void)initialize
{
    [super initialize];
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
//    
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    dic[NSForegroundColorAttributeName] = RGBColor(233, 163, 52);
//    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
//    
//    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    TakeoutViewController *takeout = [[TakeoutViewController alloc]init];
    takeout.view.backgroundColor = RGBColor(238, 238, 238);
    [self setTabbarWithVc:takeout title:@"外卖" image:@"takeout_normal" selectedImage:@"takeout_selected"];
    
    OrderViewController *order = [[OrderViewController alloc]init];
    order.view.backgroundColor = RGBColor(238, 238, 238);
    [self setTabbarWithVc:order title:@"订单" image:@"order_normal" selectedImage:@"order_selected"];
    
    ProfileViewController *personal = [[ProfileViewController alloc]init];
    personal.view.backgroundColor = RGBColor(238, 238, 238);
    [self setTabbarWithVc:personal title:@"我的" image:@"profile_normal" selectedImage:@"profile_selected"];
    
}

- (void)setTabbarWithVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    MainNavigationController *navVc = [[MainNavigationController alloc]initWithRootViewController:childVc];
    
    childVc.tabBarItem.title = title;
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navVc];
}



@end
