//
//  AppDelegate.m
//  UIframTest
//
//  Created by weixing on 14-4-28.
//  Copyright (c) 2014年 WeiXingApp. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "SecViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

#import "FirstLauchGuideVC.h"
#import "Reachability.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:1.0]; //延时1秒，以便用户看清楚启动页
    
    [self  initTaBarController];
    
    self.window.backgroundColor=[UIColor  whiteColor];
    [self.window makeKeyAndVisible];

    [self  isFirstLuachtheApp];//注意 放在 makeKeyAndVisible 之后
    
    // 注册网络变化通知
    [self netWorkChangeNotifiy];
    
    return YES;
}

// 注册网络变化通知
- (void) netWorkChangeNotifiy
{
    //   获取当前网络状况两种方式
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
//    
//    reach.reachableBlock = ^(Reachability * reachability)
//    {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"网络可能!");
//        });
//    };
//    
//    reach.unreachableBlock = ^(Reachability * reachability)
//    {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"网络不可能!");
//        });
//    };
    
    [reach startNotifier];
}


-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])// 网络是否可用
    {
        NSLog(@"NotReachable");
    }
    if ([reach isReachableViaWiFi]) // 当前网络是wifi
    {
        NSLog(@"isReachableViaWiFi");
    } else {                        // 数据网络
        NSLog(@"ReachableViaWWAN");
    }
}

////判断是不是第一次启动应用
-(void)isFirstLuachtheApp
{
    //判断是不是第一次启动应用   先覆盖根视图之后移除
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
       
        NSLog(@"第一次启动");
        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
      _fgcv=[[FirstLauchGuideVC  alloc]init];;
        NSLog(@"%@",_fgcv.view);
        
        [self.window  addSubview:self.fgcv.view];
        
    }
    
}



//分页栏视图控制器
-(void)initTaBarController
{
    float   phoneWindowWidth=self.window.frame.size.width;
    float  phoneWindowHeight=self.window.frame.size.height;
    NSLog(@"%f---%f",phoneWindowWidth,phoneWindowHeight);
    
    RootViewController *newInfoViewController = [[RootViewController alloc]init];
    newInfoViewController.title = @"资讯";
    newInfoViewController.tabBarItem.image = [UIImage imageNamed:@"infomation.png"];
    UINavigationController *infoNav = [[UINavigationController alloc] initWithRootViewController: newInfoViewController];
    //infoNav.view.frame = CGRectMake(0, 0, phoneWindowWidth, phoneWindowHeight);
    //infoNav.navigationBar.hidden = YES;
    
    SecViewController *hotPicViewController = [[SecViewController alloc] init];
    hotPicViewController.title = @"热图";
    hotPicViewController.tabBarItem.image = [UIImage imageNamed: @"hotPic.png"];
    UINavigationController *pictureNav = [[UINavigationController alloc] initWithRootViewController: hotPicViewController];
    //pictureNav.view.frame = CGRectMake(0, 0, phoneWindowWidth, phoneWindowHeight);
   // pictureNav.navigationBar.hidden = YES;
    
    ThirdViewController *topicViewController = [[ThirdViewController alloc] init];
    topicViewController.title = @"分类";
    topicViewController.tabBarItem.image = [UIImage imageNamed: @"topic.png"];
    UINavigationController *topicNav = [[UINavigationController alloc] initWithRootViewController: topicViewController];
   // topicNav.view.frame = CGRectMake(0, 0, phoneWindowWidth, phoneWindowHeight);
    //topicNav.navigationBar.hidden = YES;
    
    FourViewController *favoriteViewController = [[FourViewController alloc] init];
    favoriteViewController.title = @"收藏";
    favoriteViewController.tabBarItem.image = [UIImage imageNamed: @"favorite.png"];
    UINavigationController *favNav = [[UINavigationController alloc] initWithRootViewController: favoriteViewController];
    //favNav.view.frame = CGRectMake(0, 0, phoneWindowWidth, phoneWindowHeight);
    //favNav.navigationBar.hidden = YES;
    
    FiveViewController *setting = [[FiveViewController alloc] init];
    setting.title = @"设置";
    setting.tabBarItem.image = [UIImage imageNamed: @"more.png"];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController: setting];
    settingNav.navigationBar.hidden = YES;
    
    
    
    UITabBarController    *tabBarController = [[UITabBarController alloc] init] ;
    tabBarController.viewControllers = [NSArray arrayWithObjects:infoNav, pictureNav, topicNav, favNav, settingNav, nil];
    self.window.rootViewController = tabBarController;



}







- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
