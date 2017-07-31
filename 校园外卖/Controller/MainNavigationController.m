//
//  MainNavigationController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/14.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "MainNavigationController.h"


@implementation MainNavigationController
-(void)viewDidLoad
{
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_background"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count>1) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"back" highlight:@"navigationbar_back_highlighted" target:self action:@selector(back)];
    }
    viewController.view.backgroundColor = RGBColor(238, 238, 238);
    
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
