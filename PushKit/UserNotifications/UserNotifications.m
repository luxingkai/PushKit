//
//  UserNotifications.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "UserNotifications.h"

@interface UserNotifications ()

@end

@implementation UserNotifications

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Push user-facing notifications to the user's device from a
     server, or generate them locally from your app.
     
     User-facing notifications communications important information
     to users of your app, regardless of whether your app is
     running on the uesr's device. For example, a sports app can
     let the user know when their favorite team scores. Notifications
     can also tell you app to download information and update its
     interface. Notifications can display an alert, play a sound,
     or badge the app's icon.
     file:///Users/tigerfly/Desktop/58245c65-723d-4785-84e1-11d7534c6e11.png
     
     You can generate notifications locally from your app or
     remotely from a server that you manage. For local notifications,
     the app creates the notification content and specifies a
     condition, like a time or location, that triggers the delivery
     of the notification. For remote notifications (also known as
     push notifications), you use one of your company's servers to
     generate notifications, and Apple Push Notification service
     (APNs) handles the delivery of those notifications to the
     user's devices.
     
     Use this framework to:
     •  Define the types of notifications that your app supports.
     •  Define any custom actions associated with your notification types.
     •  Schedule local notifications for delivery.
     •  Process already delivered notifications.
     •  Respond to user-selected actions.
     
     Every attempt is made to deliver local and remote notifications
     in a timely manner, but delivery isn’t guaranteed. The PushKit
     framework offers a more timely delivery mechanism for specific
     types of notifications, such as those used for VoIP and watchOS
     complications. For more information, see PushKit.
     
     ⚠️ Siri can provide suggestions to users in search, News,
     Safari, and other apps using on-device information that
     your app contributes through the Notifications API. Users
     can change this at any time through Siri & Search settings
     for your app.
     */
    
    UNNotificationSound
    
    
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
