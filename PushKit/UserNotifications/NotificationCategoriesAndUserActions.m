//
//  NotificationCategoriesAndUserActions.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NotificationCategoriesAndUserActions.h"
#import <UserNotifications/UserNotifications.h>

@interface NotificationCategoriesAndUserActions ()

@end

@implementation NotificationCategoriesAndUserActions

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- UNNotificationCategory
    
    /**
     A type of notification that your app supports and the custom
     actions to display with it.
     
     A UNNotificationCategory object defines a type of notification
     that your executable can receive. You create category objects
     to define your app's actionable notifications-- that is,
     notificaitons that have action buttons that the user can select
     in response to the notification. Each category object you create
     stores the actions and other behaviors associated with a specific
     type of notification. Register your category objects using the
     setNotificationCategories: method of UNUserNotificationCenter.
     You can register as many category objects as you want.
     
     To apply category objects to your notifications, include
     the category’s identifier string in the payload of any
     notifications you create. For local notifications, put this
     string in the categoryIdentifier property of the
     UNMutableNotificationContent object that you use to specify
     the notification’s content. For remote notifications, use
     this string as the value of the category key in the aps
     dictionary of your payload.
     
     Categories can have associated actions, which define custom
     buttons to display for notifications of that category. When
     space is unlimited, the system displays up to 10 actions.
     When space is limited, the system displays at most two actions.
     
     */
    
    /**
     Creating a Notification Category
     */
    
//    UNNotificationCategory categoryWithIdentifier:<#(nonnull NSString *)#> actions:<#(nonnull NSArray<UNNotificationAction *> *)#> intentIdentifiers:<#(nonnull NSArray<NSString *> *)#> options:<#(UNNotificationCategoryOptions)#>
//    UNNotificationCategory categoryWithIdentifier:<#(nonnull NSString *)#> actions:<#(nonnull NSArray<UNNotificationAction *> *)#> intentIdentifiers:<#(nonnull NSArray<NSString *> *)#> hiddenPreviewsBodyPlaceholder:<#(nonnull NSString *)#> options:<#(UNNotificationCategoryOptions)#>
//    UNNotificationCategory categoryWithIdentifier:<#(nonnull NSString *)#> actions:<#(nonnull NSArray<UNNotificationAction *> *)#> intentIdentifiers:<#(nonnull NSArray<NSString *> *)#> hiddenPreviewsBodyPlaceholder:<#(nullable NSString *)#> categorySummaryFormat:<#(nullable NSString *)#> options:<#(UNNotificationCategoryOptions)#>
    
    /**
     Getting the Category Information
     
     identifier
     The unique string assigned to the category.
     
     actions
     The actions to display when a notification of this type is presented.
     
     intentIdentifiers
     The intents related to notifications of this category.
     
     hiddenPreviewsBodyPlaceholder
     The placeholder text to display when notification previews
     are disabled for the app.
     
     categorySummaryFormat
     A format string for the summary description used when the system
     groups the category’s notifications.
     */
    
    /**
     Getting the Category Options
     
     options
     Options for how to handle notifications of this type.
     
     UNNotificationCategoryOptions
     Constants indicating how to handle notifications associated with this category.
     */
    
    
#pragma mark -- UNNotificationAction
    
    /**
     A task to perform in response to a delivered notification.

     Use UNNotificationAction objects to define the actions that
     your app can perform in response to a delivered notification.
     You define the actions that your app supports. For example, a
     meeting app might define actions for accepting or rejecting a
     meeting invitation. The action object itself contains the title
     to display in an action button and the button's appearance.
     After creating action objects, add them to a UNNotificationCategory
     object and register your categories with the system.

     Responding to the Selection of Actions
     When the user selects one of your actions in response
     to a notification, the system notifies the delegate of
     the shared UNUserNotificationCenter object. Specifically,
     the system calls the
     userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:
     method of your delegate object. The response object passed to
     your delegate includes the identifier string of the action that
     was selected, which you can use to perform the corresponding task.
     
     For information on how to handle actions, see Handling
     Notifications and Notification-Related Actions.
     */
    
    /**
     Creating an Action
     
     + actionWithIdentifier:title:options:
     Creates an action object with the specified title and options.
     */
    
    /**
     Getting the Action Information
     
     identifier
     The unique string that your app uses to identify the action.
     
     title
     The localized string to use as the title of the action.
     */
    
    /**
     Getting the Action Options
     
     options
     The behaviors associated with the action.
     
     UNNotificationActionOptionNone
     The action has the default behavior.
     
     UNNotificationActionOptions
     The behaviors you can apply to an action.
     */
    
    
#pragma mark -- UNTextInputNotificationAction
    
    /**
     An action that can accept user-typed text.
     
     Use UNTextInputNotificationAction objects to define an
     action that allows the user to provide a custom text-based
     response. When the user selects an action of this type,
     the system displays controls for the user to enter or
     dictate the text content. That text is then included in
     the response object that is delivered to your app.
     */
    
    /**
     Creating a Text Input Action
     
     + actionWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:
     Creates an action object that accepts text input from the user.
     */
    
    /**
     Getting the Text Input Information
     
     textInputButtonTitle
     The localized title of the text input button that is displayed to the user.
     
     textInputPlaceholder
     The localized placeholder text to display in the text input field.
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
