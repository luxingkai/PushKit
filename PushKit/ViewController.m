//
//  ViewController.m
//  PushKit
//
//  Created by tigerfly on 2020/12/12.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    // 处理用户通知授权
    UNUserNotificationCenter *notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    [notificationCenter requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionProvisional completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (error) {
            //handle the error
            return;
        }
        
        // Enable or disable features based on the authorization
        if (granted == YES) {
            
        }
        
    }];
    
    
    
    
    
}


@end
