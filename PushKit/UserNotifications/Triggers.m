//
//  Triggers.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "Triggers.h"
#import <UserNotifications/UserNotifications.h>
@interface Triggers ()

@end

@implementation Triggers

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Define the trigger conditions for delivering notifications.
     Detect when a remote notification was delivered from APNs.
     */
    
    
#pragma mark -- UNCalendarNotificationTrigger
    
    /**
     A trigger condition that causes a notification to be
     delivered at a specific date and time.
     
     Create a UNCalendarNotificationTrigger object when you
     want to schedule the delivery of a local notification at
     the specified date and time. You specify the temporal
     information using an NSDateComponents object, which lets
     you specify only the time values that matter to you. The
     system uses the provided information to determine the next
     date and time that matches the specified information.
     
     Listing 1 creates a trigger that delivers its notification
     every morning at 8:30. The repeating behavior is achieved by
     specifying true for the repeats parameter when creating the
     trigger.
     ============================================================
     Listing 1 Creating a trigger that repeats at a specific time
     NSDateComponents* date = [[NSDateComponents alloc] init];
     date.hour = 8;
     date.minute = 30;
     UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
                          triggerWithDateMatchingComponents:date repeats:YES];
     ===========================================================
     */
    
    /**
     Creating a Calendar Trigger
     */
//    UNCalendarNotificationTrigger triggerWithDateMatchingComponents:<#(nonnull NSDateComponents *)#> repeats:<#(BOOL)#>
    
    /**
     Getting the Trrigger Information
     
     - nextTriggerDate
     The next date at which the trigger conditions will be met.
     
     dateComponents
     The date components used to construct this object.
     */
    
    
    
#pragma mark -- UNTimeIntervalNotificationTrigger
    
    /**
     A trigger condition that causes a notification to be
     delivered after the specified amount of time elapses.
     
     Create a UNTimeIntervalNotificationTrigger object when you
     want to schedule the delivery of a local notification after
     the specified number of seconds elapse. You use this type of
     trigger to implement timers.
     
     Listing 1 creates a trigger that delivers its notification
     one time after thirty minutes have elapsed.
     ===========================================================
     // Fire in 30 minutes (60 seconds times 30)
     UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                          triggerWithTimeInterval:(30*60) repeats: NO];
     ===========================================================
     */

    /**
     Creating a Time Interval Trigger
     */
//    UNTimeIntervalNotificationTrigger triggerWithTimeInterval:<#(NSTimeInterval)#> repeats:<#(BOOL)#>
    
    /**
     Getting the Trigger Information
     
     - nextTriggerDate
     The next date at which the trigger conditions will be met.
     
     timeInterval
     The time interval used to create the trigger.
     */
    
    
#pragma mark -- UNLocationNotificationTrigger
    
    /**
     A trigger condition that causes a notification to be delivered
     when the user's device enters or exits the specified geographic region.
     
     Create a UNLocationNotificationTrigger object when you want to
     schedule the delivery of a local notification when the device
     enters or leaves a specific geographic region. The system limits
     the number of location-based triggers that may be scheduled at
     the same time.
     
     ⚠️ Before scheduling any notifications using this trigger, 
     your app must have authorization to use Core Location and
     must have when-in-use permissions. (Because the system actually
     monitors the regions, you don't need to request always permissions
     for your app.) For information about how to request authorization,
     see Requesting When-In-Use Authorization.
     
     When configuring the region, use the notifyOnEntry and
     notifyOnExit properties to specify whether you want notifications
     to be delivered on entry, on exit, or both. Listing 1 shows the
     creation of a trigger that fires only once when the user’s device
     enters a circular region with a 2-kilometer radius.
     ===========================================================
     Listing 1 Creating a location-based trigger
     CLLocationCoordinate2D center = CLLocationCoordinate2DMake(37.335400, -122.009201);

     CLCircularRegion* region = [[CLCircularRegion alloc] initWithCenter:center
                      radius:2000.0 identifier:@"Headquarters"];
     region.notifyOnEntry = YES;
     region.notifyOnExit = NO;

     UNLocationNotificationTrigger* trigger = [UNLocationNotificationTrigger
                      triggerWithRegion:region repeats:NO];
     ===========================================================

     Region-based notifications aren't always triggered immediately
     when the edge of the boundary is crossed. The system applies
     heuristics to ensure that the boundary crossing represents a
     deliberate event and is not the result of spurious location data.
     For more information about the heuristics that are applied,
     see https://developer.apple.com/documentation/corelocation/monitoring_the_user_s_proximity_to_geographic_regions?language=objc
     */
    
    /**
     Creating a Location Trigger
     */
//    UNLocationNotificationTrigger triggerWithRegion:<#(nonnull CLRegion *)#> repeats:<#(BOOL)#>
    
    /**
     Accessing the Trigger Region
     
     region
     The region used to determine when the notification is sent.
     */
    
    
#pragma mark -- UNPushNotificationTrigger

    
    /**
     A trigger condition that indicates the notification was sent
     from Apple Push Notification Service (APNs).
     
     You don't create instances of this class yourself. The system
     creates UNPushNotificationTrigger objects and associates them
     with requests that originated from Apple Push Notification
     service. You encounter instances of this class when managing
     your app’s delivered notification requests, which store an
     object of this type in their trigger property.
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
