//
//  NotificationRequests.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NotificationRequests.h"
#import <UserNotifications/UserNotifications.h>

@interface NotificationRequests ()

@end

@implementation NotificationRequests

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Create delivery requests for local notifications, and access
     the content of delivered local and remote notifications.
     */
    
    
#pragma mark -- Scheduling a Notification Locally from Your App
    
    /*
     Create and schedule notifications from your app when you
     want too get the use's attention.
     
     Use local notifications to get the user's attention. You can
     display an alert, play a sound, or badge your app's icon.
     For example, a background app could ask the system to display
     an alert when a particular task is finished. Always use local
     notifications to convey important information that the user
     wants.
     
     The delivery of notifications is handled by the system, based
     on a time or location that you specify. If the delivery of the
     notification occurs when your app is not running or in the
     background, the system interacts with the user for you. If
     your app is in the foreground, the system delivers the
     notification to your app for handling.
     */
    
    /**
     Create the Notification's content
     
     Fill in the properties of a UNMutableNotificationContent object
     with the details of your notification. The fields you fill in
     define how your notification in delivered. For example, to play
     a sound, assign a value to the sound property of the object.
     Listing 1 shows a content object that displays an alert containing
     a title string and body text. You can specify multiple types of
     interaction in the same request.
     
     ============================================================
     Listing 1 Configuring the notification content
     
     let content = UNMutableNotificationContent()
     content.title = "Weekly Staff Meeting"
     content.body = "Every Tuesday at 2pm"
     ============================================================
     */
    
    /**
     Specify the Conditions for Delivery
     
     Specify the conditions for delivery your notification using
     a UNCalenderNotificationTrigger, UNTimeIntervalNotificationTrigger,
     or UNLocationNotificationTrigger object. Each trigger object
     requires different parameters. For example, a calender-based
     trigger requires you to specify the date and time of delivery.
     
     List 2 shows you how to configure a notification to be delivered
     every Tuesday at 2pm. The DateComponents structure specifies the
     timing for the event. Configuring the trriger with the repeats
     parameter set to YES causes the system to reschedule the event
     after its delivery.
     
     ============================================================
     Listing 2 Configuring a recurring date-based trigger
     // Configure the recurring date.
     var dateComponents = DateComponents()
     dateComponents.calendar = Calendar.current

     dateComponents.weekday = 3  // Tuesday
     dateComponents.hour = 14    // 14:00 hours
        
     // Create the trigger as a repeating event.
     let trigger = UNCalendarNotificationTrigger(
              dateMatching: dateComponents, repeats: true)
     ============================================================
     */
    
    
    /**
     Create and Register a Notification Request
     
     Create a UNNotificationRequest object that includes your
     content and trigger conditions, and call the
     addNotificationRequest:withCompletionHandler:
     method to schedule your request with the system. Listing 3
     shows an example that uses the content from Listing 1 and
     Listing 2 to fill in the request object.
     
     ============================================================
     Listing 3 Registering the notification request
     // Create the request
     let uuidString = UUID().uuidString
     let request = UNNotificationRequest(identifier: uuidString,
                 content: content, trigger: trigger)

     // Schedule the request with the system.
     let notificationCenter = UNUserNotificationCenter.current()
     notificationCenter.add(request) { (error) in
        if error != nil {
           // Handle any errors.
        }
     }
     ============================================================
     */
    
    /**
     Cancel a Scheduled Notification Request
     
     Once scheduled, a notification request remains active until
     its trigger condition is met, or you explicitly cancel it.
     Typically, you cancel a request when conditions change and
     you no longer need to notify the user. For example, if the
     user completes a reminder, you would cancel any active requests
     associated with that reminder. To cancel an active notification
     request, call the removePendingNotificationRequestsWithIdentifiers:
     method of UNUserNotificationCenter.
     */
    
    
#pragma mark -- UNNotificationRequest
    
    /**
     A request to schedual a local notification, which includes
     the content of the notification and the trigger conditions
     for delivery.
     
     Create a UNNotificationRequest object when you want to
     schedule the delivery of a local notification. A notification
     request object contains a UNNotificationContent object with
     the payload to be delivered, and it contains the
     UNNotificationTrigger object with the conditions that trigger
     the delivery of the notification. To schedual the delivery of
     your notification, pass your request object to the
     addNotificationRequest:WithCompletionHandler: method of the
     shared user notification center object.
     
     After scheduling a request, you interact with UNNotificationRequest
     objects in the following ways:
     •  View your app's pending notifications by calling the
        getPendingNotificationRequestsWithCompletionHandler:
        method of your shared user notification center object.
     •  When a notification is delivered to your app, the provided
        UNNotification object contains a UNNotificationRequst object
        that you can inspect to get the notification details.
     •  Use the request's identifier to remove delivered notification
        from Notification Center.
     When receiving a local or remote notification, use the provided
     UNNotificationRequest object to fetch details about the notification.
     */
    
    
    /**
     Creating a Notification Request
     */
    UNNotificationContent *content = [UNNotificationContent new];
    UNNotificationTrigger *trigger = [UNNotificationTrigger new];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"" content:content trigger:trigger];
    
    /**
     Getting the Request Details
     */
//    request.identifier
//    request.content
//    request.trigger
    
    
#pragma mark -- UNNotification
    
    /**
     The data for a local or remote notification that was
     delivered to your app.
     
     A UNNotification object contains the initial notification request,
     which contains the notification's payload, and the date on which
     the notification was delivered.
     
     Don't create notification objects directly. When handling notifications,
     the system delivers notification objects to your UNUserNotificationCenterDelegate
     object. The UNUserNotificationCenter object also maintains the list of
     notifications that were previously delivered, and you use the
     getDeliveredNotificationsWithCompletionHandler: method to retrieve
     those objects.
     */
    
    /**
     Getting the Notification Details
     
     request
     The notification request containing the payload and trigger
     condition for the notification.
     
     date
     The delivery date of the notification.
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
