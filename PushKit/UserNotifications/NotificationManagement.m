//
//  NotificationManagement.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NotificationManagement.h"
#import <UserNotifications/UserNotifications.h>
@interface NotificationManagement ()<UNUserNotificationCenterDelegate>

@end

@implementation NotificationManagement

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark --  UNUserNotificationCenter
    
    
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
     
     Use the methods of the UNUesrNotificationCenterDelegate protocol
     to handle user-selected actions from notifications, and to process
     notifications that arrive when your app is running in the foreground.
     After implementing these methods in an object, assign that object
     to the delegate property of the shared UNUserNotificationCenter onject.
     The user notification center calls the methods of your delegate at
     appropriate times.
     
     ⚠️ You must assign your delegate object to the UNUserNotificationCenter
     object before your app finishes launching. For example, in an iOS app,
     you must assign it in the application:willFinishLaunchingWithOptions:
     or application:didFinishLaunchingWithOptions: method of your app delegate.
     Assigning a delegate after these methods are called might cause you
     to miss incoming notifications.
     */
    center.delegate = self;
    
    
    /**
     Managing Settings and Authorization
     
     requestAuthorizationWithOptions:completionHandler:
     || Requests authorization to interact with the user when local
        remote notifications are delivered to the user's device.
        
        If your app's local or remote notifications involve user interations,
        you must request authorization for the system to perform those
        interations on your app's hehalf. Interactions include displaying an
        alert, playing a sound, or badging the app's icon.
     
        ⚠️ Always call this method before scheduling any local notifications
        and before registering with the Apple Push Notification service. Do
        this in a context that helps the user understand why your app needs
        authorization.
        
        The first time your app ever calls the method, the system prompts the
        user to authorize the requested interactions. The uesr may grant or
        deny authorization, and the system stores the user's response so
        that subsequent calls to this method do not prompt the user again.
        After determining the authorization status, the user notification
        center object executes the block in the completion Handler parameter.
        Ues the block to make any adjustments to your app's behavior. For
        example, if authorization was denied, you might notify a remote
        notification server not to send notifications to the user's device.
     
        The user may change the allowed interactions at any time in system
        settings. Use the getNotificationSettingsWithCompletionHandler:
        method to determine what interactions are currently allowed
        for your app.
     
     
     getNotificationSettingsWithCompletionHandler:
     || Requests the notifications settings for this app.
        
        Use this method to determine the user interactions and
        notification-related features that your app is authorized
        to use. You might then use this information to enable or
        disable specific notification-related features of your app.
     
        When the user initially grants authorization to your app,
        the system gives your app a set of default notification-related
        settings. The users may change those settings at any time
        to enable or disable specific capabilities. For example, the
        user might disable the playing of sounds when a notification
        arrives.
     
     
     supportsContentExtensions
     || A Boolean value indicating whether the current device
        supports notification content extensions.
     
        Notification content extensions let you customize the
        appearance of the alerts displayed for your app's notifications.
        The value of this property is YES for devices that support
        notification content extensions and NO for devices that do
        not support them.
     */

    
    /**
     Registering the Notification Categories
     
     setNotificationCategories:
     || Registers your app's notification types and the custom actions
        that they support
     
        Call this method at launch time to register your app's actionable
        notification types. This method registers all of your categories
        at once, replacing any previously registered categories with the
        new ones in the categories parameter. Typically, you call this
        method only once.
     
        Each object in the categories parameters contains a strings for
        identifying the notificatio's type. It also contains one for
        more custom actions that the user may perform in response to
        notifications of that type. When the system displays an alert
        for a notification, it looks in the notification payload for one
        of the identifier strings from your category objects. If it finds
        one, it adds user-selectable buttons for each action associated
        with that category object. Tapping a button notifies your app
        of the selected action, without bringing your app to the foreground.
     
     getNotificationCategoriesWithCompletionHandler:
     || Retrieves the app's currently registered notification categories.
     
        Use this method to retrieve your app's currently registered
        notification types. You might use this method when you want to
        augment the current set of categories with new categories later
        on. Simply merge the returned set with any new category objects
        and register the updated set.
     */

    
    
    /**
     Scheduling and Canceling Notification Requests
     
     addNotificationRequest:withCompletionHandler:
     || Schedules a local notification for delivery.
        
        This method schedules local notifications only; you cannot use
        it to schedule the delivery of remote notifications. Upon calling
        this method, the system begins tracking the trigger conditions
        associated with your request. When the trigger condition is met,
        the system delivers your notification. If the request does not
        contain a UNNotificationTrigger object, the notification is
        delivered right away.
        
        You mat call this method from any thread of your app.
     
     
     getPendingNotificationRequestsWithCompletionHandler:
     || Returns a list of all notification requests that are scheduled
        and waiting to be delivered.
        
        This method executes asynchronously, returning immediately and
        executing the provided block on a secondary thread when the
        results are available.
     
     
     removePendingNotificationRequestsWithIdentifiers:
     || Unschedules the specified notification requests.
     
        This method executes asynchronously, removing the pending
        notification requests on a secondary thread.
     
     
     removePendingNotificationRequestsWithIdentifiers:
     || Unschedules all pending notification requests.
     
        This method executes asynchronously, removing all pending
        notification requests on a secondary thread.
    */

    
    /**
     Managing Delivered Notifications
     
     getDeliveredNotificationsWithCompletionHandler:
     || Returns a list of the app's notifications that are still
        displayed in Notification Center.
     
        This method executes asynchronously, returning immediately
        and executing the provided block on a background thread when
        the results become available.
     
     removeDeliveredNotificationsWithIdentifiers:
     || Removes the specified notification requests from Notification
        Center.
     
        Use this method to selectively remove notifications that you
        no longer want displayed in Notification Center. The method
        executes asynchronously, returning immediately and removing
        the specified notifications on a background thread.
     
     removeAllDeliveredNotifications
     || Removes all of the app's delivered notifications from Notification
        Center.
     
        Use this method to remove all of your app's delivered notifications
        from Notification Center. The method executes asynchronously, returning
        immediately and removing the identifiers on a background thread.
        This method does not affect any notification requests that are
        scheduled, but have not yet been delivered.
     */

    
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
