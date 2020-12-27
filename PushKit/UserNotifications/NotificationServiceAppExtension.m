//
//  NotificationServiceAppExtension.m
//  PushKit
//
//  Created by tigerfly on 2020/12/26.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NotificationServiceAppExtension.h"

@interface NotificationServiceAppExtension ()

@end

@implementation NotificationServiceAppExtension

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     Use a notification service app extension to modify the
     content of a notification before it's delivered to your app.
     */
    
    
#pragma mark -- Modifying Content in Newly Delivered Notifications

    /**
     Modify the payload of a remote notification before it's
     displayed on the user’s iOS device.

     You may want to modify the content of a remote notification
     on a user’s iOS device if you need to:
     •  Decrypt data sent in an encrypted format.
     •  Download images or other media attachments whose size
        would exceed the maximum payload size.
     •  Update the notification's content, perhaps by incorporating
        data from the user's device.

     Modifying a remote notification requires a notification
     service app extension, which you include inside your iOS
     app bundle. The app extension receives the contents of your
     remote notifications before they are displayed to the user,
     giving you time to update the notification payload before
     the user is alerted. You control which notifications are
     handled by your extension.

     ⚠️ Notification service app extensions only operate on remote
     notifications that are configured to display an alert to the
     user. If alerts are disabled for your app, or if the payload
     specifies only the playing of a sound or the badging of an
     icon, the extension is not employed.

     */
    
    /**
     Add a Service App Extension to Your Project

     A notification service app extension ships as a separate
     bundle inside your iOS app. To add this extension to your app:
     1. Select File > New > Target in Xcode.
     2. Select the Notification Service Extension target from the iOS > Application section.
     3. Click Next.
     4. Specify a name and other configuration details for your app extension.
     5. Click Finish.
     */
    
    /**
     Implement Your Extension's Handler Methods

     The notification service app extension template provided by
     Xcode includes a default implementation for you to modify.

     •  Use the didReceiveNotificationRequest:withContentHandler:
        method to create a new UNMutableNotificationContent object
        with the updated content.
     •  Use the serviceExtensionTimeWillExpire method to terminate
        any payload-modification tasks that are still running.

     Your didReceiveNotificationRequest:withContentHandler: method
     has only about 30 seconds to modify the payload and call the
     provided completion handler. If your code takes longer than that,
     the system calls the serviceExtensionTimeWillExpire method,
     at which point you must return whatever you can to the system
     immediately. If you fail to call the completion handler from
     either method, the system displays the original contents of
     the notification.
     
     Listing 1 shows an implementation of the UNNotificationServiceExtension
     object that decrypts the contents of a secret message delivered
     using a remote notification. The
     didReceiveNotificationRequest:withContentHandler: method
     decrypts the data and returns a modified version of the
     notification’s content if it is successful. If it is
     unsuccessful, or if time expires, the extension returns
     content indicating that the data is still encrypted.
     
     Listing 1 Decrypting data contained in a remote notification
     ========================================================
     // Storage for the completion handler and content.
     var contentHandler: ((UNNotificationContent) -> Void)?
     var bestAttemptContent: UNMutableNotificationContent?
     // Modify the payload contents.
     override func didReceive(_ request: UNNotificationRequest,
              withContentHandler contentHandler:
              @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy()
              as? UNMutableNotificationContent)
        
        // Try to decode the encrypted message data.
        let encryptedData = bestAttemptContent?.userInfo["ENCRYPTED_DATA"]
        if let bestAttemptContent = bestAttemptContent {
           if let data = encryptedData as? String {
              let decryptedMessage = self.decrypt(data: data)
             bestAttemptContent.body = decryptedMessage
           }
           else {
              bestAttemptContent.body = "(Encrypted)"
           }
           
           // Always call the completion handler when done.
           contentHandler(bestAttemptContent)
        }
     }
         
     // Return something before time expires.
     override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler,
           let bestAttemptContent = bestAttemptContent {
              
           // Mark the message as still encrypted.
           bestAttemptContent.subtitle = "(Encrypted)"
           bestAttemptContent.body = ""
           contentHandler(bestAttemptContent)
        }
     }
     ========================================================
     */
    
    
#pragma mark -- Configure the Payload for the Remote Notification

    /**
     The system executes your notification service app extension
     only when a remote notification’s payload contains the
     following information:
     
     •  The payload must include the mutable-content key
        with a value of 1.
     •  The payload must include an alert dictionary with
        title, subtitle, or body information.
     
     Listing 2 shows the JSON data for a notification payload
     containing encrypted data. The mutable-content flag is set
     so that the user’s device knows to run the corresponding
     service app extension, the code for which is shown in .
     ========================================================
     {
        "aps" : {
           "category" : "SECRET",
           "mutable-content" : 1,
           "alert" : {
              "title" : "Secret Message!",
              "body"  : "(Encrypted)"
          },
        },
        "ENCRYPTED_DATA" : "Salted__·öîQÊ$UDì_¶Ù∞èΩ^¬%gq∞NÿÒQùw"
     }
     ========================================================
     */
    
    
#pragma mark -- UNNotificationServiceExtension
    
    /**
     An object that modifies the content of a remote
     notification before it's delivered to the user.

     A UNNotificationServiceExtension object provides the
     entry point for a Notification Service app extension,
     which lets you customize the content of a remote notification
     before it is delivered to the user. A Notification Service
     app extension doesn't present any UI of its own. Instead, it
     is launched on demand when a notification of the appropriate
     type is delivered to the user’s device. You use this extension
     to modify the notification’s content or download content
     related to the extension. For example, you could use the
     extension to decrypt an encrypted data block or to download
     images associated with the notification.
     
     You don't create UNNotificationServiceExtension objects
     yourself. Instead, the Xcode template for a Notification
     Service Extension target contains a subclass for you to
     modify. Use the methods of that subclass to implement your
     app extension’s behavior. When a remote notification for
     your app is received, the system loads your extension and
     calls its didReceiveNotificationRequest:withContentHandler:
     method only when both of the following conditions are met:
     •  The remote notification is configured to display an alert.
     •  The remote notification’s aps dictionary includes the
        mutable-content key with the value set to 1.

     ⚠️ You cannot modify silent notifications or those that
     only play a sound or badge the app’s icon.

     The didReceiveNotificationRequest:withContentHandler: method
     performs the main work of your extension. You use that method
     to make any changes to the notification’s content. That
     method has a limited amount of time to perform its task
     and execute the provided completion block. If your method
     does not finish in time, the system calls the
     serviceExtensionTimeWillExpire method to give you one
     last chance to submit your changes. If you don't update
     the notification content before time expires, the system
     displays the original content.
     
     As for any app extension, you deliver a Notification
     Service app extension class as a bundle inside your app.
     The template provided by Xcode configures the Info.plist
     file automatically for this app extension type. Specifically,
     it sets the value of the NSExtensionPointIdentifier key to
     com.apple.usernotifications.service and sets the value of
     the NSExtensionPrincipalClass key to the name of your
     UNNotificationServiceExtension subclass.
     */
    
    /**
     Subclassing Notes
     
     The Xcode templates provide a subclass of
     UNNotificationServiceExtension for you to modify.
     You must implement the
     didReceiveNotificationRequest:withContentHandler:
     method and use it to process incoming notifications.
     It is also strongly recommended that you override
     the serviceExtensionTimeWillExpire method.
     */
    
    
    /**
     Processing Notifications
     
     - didReceiveNotificationRequest:withContentHandler:
     Asks you to make any needed changes to the notification and
     notify the system when you're done.
     
     - serviceExtensionTimeWillExpire
     Tells you that your extension is about to be terminated.
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
