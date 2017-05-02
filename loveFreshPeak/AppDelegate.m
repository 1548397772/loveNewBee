//
//  AppDelegate.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AppDelegate.h"
#import "AJAppConst.h"
#import "AJMainTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setAppStyle];
    [self buildKeyWindow];
    return YES;
}

- (void)buildKeyWindow{
    self.window = [[UIWindow alloc]init];
    [self.window makeKeyAndVisible];
    NSString *isFirestOpenApp = [[NSUserDefaults standardUserDefaults]objectForKey:IsFirstOpenApp];
    if (isFirestOpenApp == nil) {
#warning mark - 这里正常是跳入到版本新特新界面
        [self showMainTabBarController];
        [[NSUserDefaults standardUserDefaults]setObject:IsFirstOpenApp forKey:IsFirstOpenApp];
    }else
    {
        [self showMainTabBarController];
    }
}


/*
 for (NSInteger i=0; i<self.childViewControllers.count; i++) {
 UIViewController *tabBarChild = [self.childViewControllers objectAtIndex:i];
 tabBarChild.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarItems[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 }
 self.tabBar.tintColor = [UIColor greenColor];
 */



- (void)setAppStyle{
    
    UITabBar *item = [UITabBar appearance];
    item.tintColor = [UIColor blackColor];//修改tabbar字体颜色
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 禁止透明度
    navigationBar.translucent = NO;
}

- (void)showMainTabBarController
{
    self.window.rootViewController = [[AJMainTabBarController alloc]init];
}

@end
