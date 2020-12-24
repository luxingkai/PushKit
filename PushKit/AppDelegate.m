//
//  AppDelegate.m
//  PushKit
//
//  Created by tigerfly on 2020/12/12.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UserNotifications.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self askPermissionToUseNotification];
    [self registerUserNotification];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UserNotifications *vc = [UserNotifications new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)askPermissionToUseNotification {
    
    UNUserNotificationCenter *userNotification = [UNUserNotificationCenter currentNotificationCenter];
    userNotification.delegate = self;
    
    [userNotification requestAuthorizationWithOptions:UNAuthorizationOptionSound | UNAuthorizationOptionBadge | UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (error != nil) {
            return;
        }
        if (granted == YES) {
            //
        }
    }];
}

- (void)registerUserNotification {
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}


#pragma mark -- UNUserNotificationCenterDelegate
/**
Asks the delegate how to handle a notification that arrived
while the app was running in the foreground.
*/
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    
}

/**
 Asks the delegate to process the user's response to
 a delivered notification.
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void(^)(void))completionHandler {
    
    
}

/**
 Asks the delegate to display the in-app notification settings.
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
   openSettingsForNotification:(nullable UNNotification *)notification {
    
    
}


#pragma mark --

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //Forward Tokens to Your Provider Server
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
}





@end
