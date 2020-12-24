//
//  Entitlements.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "Entitlements.h"

@interface Entitlements ()

@end

@implementation Entitlements

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- APS Environment Entitlement
    
    /*
     The environment for push notifications
     
     key -> aps-environment
     type -> String
     */
    
    /**
     Possible Values
     
     development
     The APNs development environment
     
     production
     The APNs production environment
     */
    
    /**
     Discussion
     
     This key specifics whether to use the development or
     production Apple Push Notification service(APNs)
     environment when registering for push notifications.
     
     Xcode sets the value of the entitlement based on your
     app's current provisioning profile. For example, if
     you're using a development provisioning profile, Xcode
     sets the value to development. Production provisioning
     profile and Prerelease Versions and Beta Testers use
     production. These default settings can be modified.
     The development environment is also referred to as the
     sandbox environment.
     
     Use this entitlement for both the UserNotifications and
     PushKit frameworks.
     
     To add this entitlement to your app, enable the Push
     Notifications capability in Xcode.
     */
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
