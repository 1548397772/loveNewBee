//
//  AJMainTabBarController.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJBaseNavigationController.h"
#import "AJMainTabBarController.h"
#import "AJHomeViewController.h"
#import "AJFlashViewController.h"
#import "AJMyViewController.h"
#import "AJUserShopCarTool.h"
#import "AJShoppingVC.h"

@implementation AJMainTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    /*********************************/
    AJHomeViewController *home = [[AJHomeViewController alloc]init];
    home.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[[UIImage imageNamed:@"v2_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"v2_home_r"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    AJBaseNavigationController *homeNav = [[AJBaseNavigationController alloc]initWithRootViewController:home];
    
    AJFlashViewController *shop = [[AJFlashViewController alloc]init];
    shop.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"闪电超市" image:[UIImage imageNamed:@"shopCart"] selectedImage:[[UIImage imageNamed:@"v2_order_r"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    AJBaseNavigationController *shopNav = [[AJBaseNavigationController alloc]initWithRootViewController:shop];
    
    AJShoppingVC *shopCart = [[AJShoppingVC alloc]init];
    shopCart.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"购物车" image:[UIImage imageNamed:@"shopCart"] selectedImage:[[UIImage imageNamed:@"shopCart_r"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    AJBaseNavigationController *shopCartNav = [[AJBaseNavigationController alloc]initWithRootViewController:shopCart];
    
    AJMyViewController *my = [[AJMyViewController alloc]init];
    my.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"v2_my"] selectedImage:[[UIImage imageNamed:@"v2_my_r"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    AJBaseNavigationController *myNav = [[AJBaseNavigationController alloc]initWithRootViewController:my];
    
    self.viewControllers = @[homeNav,shopNav,shopCartNav,myNav];
    /*********************************/
    
    [AJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}

- (void)IncreaseShoppingCart{
    
    NSInteger shoppingIndex = [[AJUserShopCarTool sharedInstance] getShopCarGoodsNumber];
    UIViewController *shoppingVC = self.childViewControllers[2];

    if (shoppingIndex == 0) {
        shoppingVC.tabBarItem.badgeValue = nil;
        return;
    }
    shoppingVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",shoppingIndex];
}
- (void)dealloc{
    [AJNotification removeObserver:self];
}


@end
