//
//  AppDelegate.m
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "AppDelegate.h"
#import "SearchBookVCViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setNav];
    return YES;
}

- (void)setNav{
    SearchBookVCViewController *searchBookVC = [[SearchBookVCViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:searchBookVC];
    nav.navigationBar.barTintColor = doubanGreen;
    nav.navigationBar.tintColor = [UIColor whiteColor];
    nav.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.window.rootViewController = nav;
}

@end
