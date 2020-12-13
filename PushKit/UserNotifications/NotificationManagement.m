//
//  NotificationManagement.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NotificationManagement.h"
#import <UserNotifications/UserNotifications.h>
@interface NotificationManagement ()

@end

@implementation NotificationManagement

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark --    UNUserNotificationCenter
    
    /*
     The central object for managing notification-related
     activities for your app or app extension.

     Use the shared UNUserNotificationCenter object to manage
     all notification-related behaviors in your app or app
     extension. Specifically, use this object to:
     
     •  Request authorization to interact with the user through
        alerts, sounds, and icon badges. (Authorization is required
        for all user interactions.) See Asking Permission to Use
        Notifications.
     •  Declare the notification types that your app supports and
        the custom actions (if any) that the user may perform when
        those notifications are delivered. See Declaring Your
        Actionable Notification Types.
     •  Schedule the delivery of notifications from your app.
        See Scheduling a Notification Locally from Your App.
     •  Process the payloads from remote notifications that are
        delivered by Apple Push Notification service (APNs). See
        Handling Notifications and Notification-Related Actions.
     •  Manage the already delivered notifications that are displayed
        in Notification Center. See Managing Delivered Notifications.
     •  Handle user-selected actions associated with your custom
        notification types; see Handling Notifications and
        Notification-Related Actions.
     •  Get the notification-related settings for your app. See
        Managing Settings and Authorization.

     To handle incoming notifications and notification-related
     actions, create an object that adopts the
     UNUserNotificationCenterDelegate protocol and assign it to
     the delegate property of this object. Always assign an object
     to the delegate property before performing any tasks that might
     interact with that delegate. It is a programmer error to assign
     a delegate object after calling methods that return information
     to the delegate.
     
     You may use the shared user notification center object
     simultaneously from any of your app's threads. The object
     processes requests serially in the order they were initiated.
     */
    
    /**
     Getting the Notification Center
     */
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    /**
     Receiving Notifications and Handling Actions
     */
    center.delegate = self;
    
    /**
     Managing Settings and Authorization
     */
//    center requestAuthorizationWithOptions:<#(UNAuthorizationOptions)#> completionHandler:<#^(BOOL granted, NSError * _Nullable error)completionHandler#>
//    center getNotificationSettingsWithCompletionHandler:<#^(UNNotificationSettings * _Nonnull settings)completionHandler#>
//    center supportsContentExtensions
    
    /**
     Registering the Notification Categories
     */
//    center setNotificationCategories:<#(nonnull NSSet<UNNotificationCategory *> *)#>
//    center getNotificationCategoriesWithCompletionHandler:<#^(NSSet<UNNotificationCategory *> * _Nonnull categories)completionHandler#>
    
    
    /**
     Scheduling and Canceling Notification Requests
     */
//    center addNotificationRequest:<#(nonnull UNNotificationRequest *)#> withCompletionHandler:<#^(NSError * _Nullable error)completionHandler#>
//    center getPendingNotificationRequestsWithCompletionHandler:<#^(NSArray<UNNotificationRequest *> * _Nonnull requests)completionHandler#>
//    center removePendingNotificationRequestsWithIdentifiers:<#(nonnull NSArray<NSString *> *)#>
//    center removeAllPendingNotificationRequests
    
    /**
     Managing Delivered Notifications
     */
//    center getDeliveredNotificationsWithCompletionHandler:<#^(NSArray<UNNotification *> * _Nonnull notifications)completionHandler#>
//    center removeDeliveredNotificationsWithIdentifiers:<#(nonnull NSArray<NSString *> *)#>
//    center removeAllDeliveredNotifications
    
    /**
     Handling Errors
     */
//    UNErrorCode
//    UNErrorDomain
    
    
#pragma mark -- UNUserNotificationCenterDelegate
    
    /**
     The interface for handling incoming notifications
     and notification-related actions.
     */
    
    /**
     Use the methods of the UNUserNotificationCenterDelegate
     protocol to handle user-selected actions from notifications,
     and to process notifications that arrive when your app is
     running in the foreground. After implementing these methods
     in an object, assign that object to the delegate property
     of the shared UNUserNotificationCenter object. The user
     notification center object calls the methods of your
     delegate at appropriate times.
     
     ⚠️ You must assign your delegate object to the
     UNUserNotificationCenter object before your app
     finishes launching. For example, in an iOS app,
     you must assign it in the application:willFinishLaunchingWithOptions:
     or application:didFinishLaunchingWithOptions: method of
     your app delegate. Assigning a delegate after these methods
     are called might cause you to miss incoming notifications.
     */
    

    /**
     Handling the Selection of Custom Actions
     */
//    - (void)userNotificationCenter:(UNUserNotificationCenter *)center
//    didReceiveNotificationResponse:(UNNotificationResponse *)response
//             withCompletionHandler:(void (^)(void))completionHandler;
    
    
    /**
     Receiving Notifications
     */
//    - (void)userNotificationCenter:(UNUserNotificationCenter *)center
//    willPresentNotification:(UNNotification *)notification
//      withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler;

    /**
     Displaying Notification Settings
     */
//    - (void)userNotificationCenter:(UNUserNotificationCenter *)center
//    openSettingsForNotification:(UNNotification *)notification;
    
    
#pragma mark -- UNNotificationSettings
    
    /**
     The object for managing notification-related settings
     and the authorization status of your app.

     A UNNotificationSettings object contains the current
     authorization status and notification-related settings
     for your app. Apps must receive authorization to schedule
     notifications and to interact with the user. Apps that
     run in CarPlay must similarly receive authorization to
     do so. You use this object to determine what
     notification-related actions your app is allowed to
     perform. You might then use that information to enable,
     disable, or adjust your app's notification-related
     behaviors. Regardless of whether you take action, the
     system enforces your app's settings by preventing
     denied interactions from occurring.
     You don't create instances of this class directly.
     Instead, call the getNotificationSettingsWithCompletionHandler:
     method of your app’s UNUserNotificationCenter object to
     get the current settings.
     */
    
    /**
     Getting the Authorization Status
     */
    UNNotificationSettings *setting = nil;
//    setting.authorizationStatus
    
    /**
     Getting Device-Specific Settings
     */
//    setting.notificationCenterSetting
//    setting.lockScreenSetting
//    setting.carPlaySetting
//    setting.alertSetting
//    setting.badgeSetting
//    setting.soundSetting
//    setting.criticalAlertSetting
//    setting.announcementSetting
    
    /**
     Getting Interface Settings
     */
//    setting.alertStyle
//    setting.showPreviewsSetting
//    setting.providesAppNotificationSettings
    
    
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
