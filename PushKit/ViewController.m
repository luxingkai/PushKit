//
//  ViewController.m
//  PushKit
//
//  Created by tigerfly on 2020/12/12.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()<UNUserNotificationCenterDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    // 处理用户通知授权
    UNUserNotificationCenter *notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    notificationCenter.delegate = self;
    [notificationCenter requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (error) {
            //handle the error
            return;
        }
        
        // Enable or disable features based on the authorization
        if (granted == YES) {
            [notificationCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                if (settings.authorizationStatus != UNAuthorizationStatusAuthorized || settings.authorizationStatus != UNAuthorizationStatusProvisional) {
                    return;
                }
                if (settings.alertSetting == UNNotificationSettingEnabled) {
                    // Schedule an alert-only notification.
                    
                }else {
                    // Schedule a notification with a badge and sound.
                }
            }];
        }
        
    }];
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
   openSettingsForNotification:(nullable UNNotification *)notification {
    
}

@end
