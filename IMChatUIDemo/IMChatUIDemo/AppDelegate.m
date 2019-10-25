//
//  AppDelegate.m
//  IMChatUIDemo
//
//  Created by MountainX on 2019/10/24.
//  Copyright © 2019 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "SSApplicationHelper.h"
#import "SSRootManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [SSApplicationHelper applicationRegister];
    
    if (@available(ios 13, *)) {
        // Initail window at SceneDeblegate->scene:willConnectToSession:options:
    } else {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        
//        RootViewController *rootVc = [[RootViewController alloc] init];
//        UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootVc];
//        self.window.rootViewController = rootNav;
        
        [SSRootManager shareRootManager];
    }
    
    return [[SSApplicationHelper shareApplicationHelper] application:application didFinishLaunchingWithOptions:launchOptions];
}

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSInteger count = [[[NIMSDK sharedSDK] conversationManager] allUnreadCount] + [NIMSDK sharedSDK].systemNotificationManager.allUnreadCount;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:count];
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [[NIMSDK sharedSDK] updateApnsToken:deviceToken];
    cout(deviceToken);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    cout(userInfo);
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    cout(error);
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
