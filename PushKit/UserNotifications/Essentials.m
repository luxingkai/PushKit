//
//  Essentials.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "Essentials.h"

@interface Essentials ()

@end

@implementation Essentials

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Asking Permission to Use Notifications
     
     Request permission to display alerts, play sounds, or badge
     the app's icon in response to a notification.
     
     Local and remote notifications get the user's attention by
     displaying an alert, playing sounds, or badging your app's
     icon. These interactions occur when your app isn't running
     or is in the background. They let users know that your app
     has relevant information for them to view. Because the user
     might consider notification-based interactions disruptive,
     you must obtain permission to use them.
     file:///Users/tigerfly/Desktop/original-1584047737.png
    */
    
    /*
     Explicitly Request Authorization in Context
     
     To ask for authorization, get the shared UNUserNotificationCenter
     instance and call its requestAuthorizationWithOptions:completionHandler:
     method. Specify all of the interaction types that your app
     employs. For example, you can request authorization to display
     alerts, add a badge to the app icon, or play sounds:
     ==============================================================
     let center = UNUserNotificationCenter.current()
     center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
         
         if let error = error {
             // Handle the error here.
         }
         
         // Enable or disable features based on the authorization.
     }
     ==============================================================

     The first time your app makes this authorization request, the
     system prompts the user to grant or deny the request and records
     the user’s response. Subsequent authorization requests don’t
     prompt the user.
     
     Make the request in a context that helps the user to understand
     why your app needs authorization. In a task-tracking app that sends
     reminder notifications, you could make the request after the user
     schedules a first task. Sending the request in context provides a
     better user experience than automatically requesting authorization
     on first launch, because the user can more easily see what purpose
     the notifications serve.

     */

    /**
     Use Provisional Authorization to Send Trial Notifications
     
     When you explicitly ask for permission to send notifications,
     users must decide whether to permit or deny permission before
     they’ve ever seen a notification from your app. Even if you
     carefully set the context before requesting authorization, users
     may not have enough information to make a decision, and might
     reject the authorization.
     
     Use provisional authorization to send notifications on a trial
     basis. Users can then evaluate the notifications and decide
     whether to authorize them.
     
     The system delivers provisional notifications quietly—they
     don’t interrupt the user with a sound or banner, or appear
     on the lock screen. Instead, they only appear in the
     notification center’s history. These notifications also
     include buttons, prompting the user to keep or turn off
     the notification.
     file:///Users/tigerfly/Desktop/PushKit/PushKit/original-1582843671.png
     
     If the user presses the Keep button, the system prompts them
     to choose between prominent or quiet notifications. If the
     user selects prominent notifications, your app gains all the
     permissions that you included in your request for provisional
     authorization. If the user chooses to receive silent
     notifications, the system authorizes your app to send
     notifications, but it doesn’t give your app permission to
     show alerts, play sounds or badge the app icon. Your
     notification only appears in the notification center history.
     
     If the user presses the Turn Off button, the system confirms
     the selection before denying your app authorization to send
     additional notifications.
     
     To request provisional authorization, add the
     UNAuthorizationOptionProvisional option when requesting
     permission to send notifications.
     ==============================================================
     let center = UNUserNotificationCenter.current()
     center.requestAuthorization(options: [.alert, .sound, .badge, .provisional]) { granted, error in
         
         if let error = error {
             // Handle the error here.
         }
         
         // Provisional authorization granted.
     }
     ==============================================================

     Unlike explicitly requesting authorization, this code
     doesn’t prompt the user for permission to receive
     notifications. Instead, the first time you call this method,
     it automatically grants authorization. However, until the
     user either explicitly keeps or turns off the notification,
     the authorization status is UNAuthorizationStatusProvisional.
     Because users can change the authorization status at any
     point, you should still check the status before scheduling
     local notifications.
     
     Additionally, if you request provisional authorization, you
     can request authorization when your app first launches. The
     user is only asked to keep or turn off notifications when
     they actually receive the notification.
     */
    
    /**
     Customize Notifications Based on the Current Authorizations
     
     Always check your app’s authorization status before scheduling
     local notifications. Users can change your app’s authorization
     settings at any time. They can also change the type of
     interactions allowed by your app—which may cause you to alter
     the number or type of notifications your app sends.
     
     To provide the best experience for your users, call the
     notification center’s getNotificationSettingsWithCompletionHandler:
     method to get the current notification settings. Then customize
     the notification based on these settings.
     ==============================================================
     let center = UNUserNotificationCenter.current()
     center.getNotificationSettings { settings in
         guard (settings.authorizationStatus == .authorized) ||
               (settings.authorizationStatus == .provisional) else { return }

         if settings.alertSetting == .enabled {
             // Schedule an alert-only notification.
         } else {
             // Schedule a notification with a badge and sound.
         }
     }
     ==============================================================
     
     The above example uses a guard condition to prevent the
     scheduling of notifications if the app isn’t authorized.
     The code then configures the notification based on the
     types of interactions allowed, preferring the use of an
     alert-based notification whenever possible.
     
     However, you may want to configure your notification with
     alert, sound, and badge information even if your app isn’t
     authorized for some of the interactions. The system still
     displays alerts in Notification Center if your
     UNNotificationSettings instance’s notificationCenterSetting
     property is set to UNNotificationSettingEnabled. Your
     notification center delegate’s
     userNotificationCenter:willPresentNotification:withCompletionHandler:
     method also receives notifications when your app is in the
     foreground, and can still access the alert, sound, or badge
     information.
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
