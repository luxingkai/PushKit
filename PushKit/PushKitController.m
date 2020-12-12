//
//  PushKitController.m
//  PushKit
//
//  Created by tigerfly on 2020/12/12.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "PushKitController.h"
#import <PushKit/PushKit.h>

@interface PushKitController ()<PKPushRegistryDelegate>

@end

@implementation PushKitController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Respond to push notifications related to your app's complications,
     file providers, and VoIP services.
     */
    
    /**
     The PushKit framework supports specialized notifications for
     updating your watchOS complications, responding to file provider
     changes, and receiving incoming Voice-over-IP (VoIP) calls.
     PushKit notifications differ from the ones you handle with the
     User Notifications framework. Instead of displaying an alert,
     badging your app's icon, or playing a sound, PushKit notitifications
     wake up or launch your app and give it time to respond. Both PushKit
     and User Notifications use the Apple Push Notification service(APNs)
     to deliver push notifications to user devices.
     
     To receive PushKit notifications, your app creates a PKPushRegistry
     object and uses it to configure the notification types it supports.
     When registration is successful, PushKit delivers a unique data token
     to your app that contains the identity of the current device and the
     push type. Forward that token along to the server, and include it in
     any notifications you send to the user. Forward that token along to
     the server, and include it in any notifications you send to the
     user. APNs uses the token to deliver the corrent type of notification
     to the users device.
     
     For information about how to configure your server to work with APNs,
     see Setting Up a remote Notification Server.
     
     ⚠️ PushKit doesn't support some special use cases in which access to
     Apple Push Notification service (APNs)isn't possible.
     */
    
    
#pragma mark -- Registration
    
    /*
     Supporting PushKit Notifications in Your App
     
     Declare the types of PushKit notifications your app supports and
     configure objects to respond to them.
     
     You must configure your app to handle PushKit-related notifications,
     and you must supply a server to generate those notifications. In your
     app, you tell PushKit what types of push notifications your app handles,
     and you write code to respond when a notificaiton arrives. You use your
     server to generate the push notifications that your app receives. When
     a user initiates a call with your service, your server creates a push
     nitification request for that call and sends it a call with your service,
     your server creates a push notification request for that call and sends
     it a call with your service, your server creates a push notification
     request for that call and sends it to Apple Push Notification service
     (APNs), which delivers that notification to the user's device.
     
     */
    
    /**
     Enable Push Notification Support for Your App
     
     Apps must have the proper entitlements to receive push notifications.
     To create these entitlements, and the push notifications capability
     to your Xcode project. When you add this capability, Xcode adds
     the APS Environment Entitlement to your app and configures your App
     ID with the push notification service for development purposes.
     
     ⚠️ If you create an explicit App ID for your app, you can also add
     the push notification service manually by configuring the App ID
     from your Developer Account page.
     */
    
    /**
     Registry Your App with PushKit at launch Time
     
     The system can't deliver push notifications to your app until you
     create a PKPushRegistry object and specify the types of notifications
     you support. Typically, you create this object at launch time and store
     a refrence to it for the duration of your app's runtime. The following
     example shows how to create this object and configura it with the
     Voices-over-IP(VoIP) push type. During configuration, always specify
     a delegate object to receive notifications.
     -=========================================================
     self.voipRegistry = [[PKPushRegistry alloc] initWithQueue:nil];
     self.voipRegistry.delegate = self;
     
     // Initiate registration.
     self.voipRegistry.desiredPushTypes = [NSSet setWithObject:PKPushTypeVoIP];
     -=========================================================
     
     Assigning a value to the desiredPushTypes property begins the
     registration process, so always update that property last. The server
     reports the success or failure of the registration process to
     your delegate object.
     */
    
    /**
     Send the Device Token to Your Server
     
     In order to deliver notifications to a user device, your server
     must know the address of that device. PushKit provides the address
     to you in the form of a device token, which is an opaque data
     Object. When you register your app's supported push types, the
     PKPushRegistry object creates a PKPushCredentials object and
     delivers it to your delegates pushRegistry:didUpdatePushCredentials:forType:
     method. The credentials object contains the device token for the
     current device.
     
     Upon receiving a device token, forward it to your server along
     with any other information you need to identify the user, such
     as their account unique identifier. To ensure the security of the
     user's information, always encrypt the token and all user data
     before sending it over the network. On your server, store device
     tokens securely with the the uesr's other account details.
     Because users can run your app on multiple devices, be prepared
     to handle multiple tokens for each notification type your app
     supports.
     */
    
    /**
     Generate Push Notifications Using the Device Token
     
     When you have data to send to the user, generate an appropriate
     POST request and send it to APNs. A VoIP service generates a
     request each time it receives an incoming call for the user.
     An app with a complication might generate a requset whenever it
     receives urgent updates for that complication.
     
     Each POST request contains a JSON payload with the data you
     want to send to the user. For most notification types, you
     may send up to 4kB (4096 bytes) of data in your payload, but
     for VoIP notifications, the limit is 5KB (5120 bytes). Include
     information in the payload that your app needs to respond.
     For example, include the new data you want your watchOS
     complication to display. If you cannot fit all of the data
     in the payload, your app can open a network connection and
     fetch any additional data it needs.
     */
    
    /*
     PKPushRegistry
     
     An object that requests the delivery and handles the receipt
     of PushKit notifications.
     
     A PKPushRegistry object manages only certain types of notifications,
     such as high-priority notifications needed by a VoIP app.
     PushKit wakes up your app as needed to deliver incoming notifications
     and delivers the notifications directly to the push registry
     object that requested them.
     
     Every time your app launches, whether in the foreground or in
     the background, create a push registry object and configure it.
     Typically, you keep the push registry object running for the
     duration of your app. Each push registry object delivers incoming
     notifications to its delegates object, which also handles the
     responses for registration requests. Listing 1 shows how to
     create a push registry object and request VoIP notifications.
     Always assign an appropriate delegate object before modifying
     the desiredPushTypes property.
     -=========================================================
     Listing 1 Creating and configuring a push registry object
     - (void) registerForVoIPPushes {
        self.voipRegistry = [[PKPushRegistry alloc] initWithQueue:nil];
        self.voipRegistry.delegate = self;
      
        // Initiate registration.
        self.voipRegistry.desiredPushTypes = [NSSet setWithObject:PKPushTypeVoIP];
     }
     -=========================================================

     Assigning a new value to the desiredPushTypes property registers the
     push registry object with the PushKit servers. The server reports
     the success or failure of your registration attempts asynchronously
     to the push registry, which then reports those results to its delegate
     object. The push registry also delivers all received notifications
     to the delegate object.
     */
    
    /**
     Initializing a Push Registry
     */
//    [PKPushRegistry alloc] initWithQueue:<#(nullable dispatch_queue_t)#>
    
    /**
     Receiving the Notification Data
     */
    PKPushRegistry *pushRegistry = nil;
//    pushRegistry.delegate
    
    /**
     Managing the Push Registry
     */
//    pushRegistry.desiredPushTypes
//    pushRegistry pushTokenForType:<#(nonnull PKPushType)#>
    
    
    /*
     PKPushRegistryDelegate
     
     The methods that you use to handle incoming PushKit
     Notifications and registration events.
     
     Implement the methods of this protocol in an object of
     your app and assign that object to the delegate property
     of your PKPushRegistry object. Use the methods of this
     protocol to process incoming notifications and to react
     to token registration and invalidation.
     */
    
    /**
     Responding to Registration Events
     */
    //- (void)pushRegistry:(PKPushRegistry *)registry didUpdatePushCredentials:(PKPushCredentials *)pushCredentials forType:(PKPushType)type
    //- (void)pushRegistry:(PKPushRegistry *)registry didInvalidatePushTokenForType:(PKPushType)type
    
    /**
     Handling an Incoming Notification
     */
    //- (void)pushRegistry:(PKPushRegistry *)registry didReceiveIncomingPushWithPayload:(PKPushPayload *)payload forType:(PKPushType)type withCompletionHandler:(void (^)(void))completion

     
    /*
     PKPushCredentials
     
     An object that encapsulates the device token you use to deliver push
     notifications to your app.
     
     When registering your app's push types, PushKit creates a PKPushCredentials
     object for each type your app supports and delivers it to your delegate's
     pushRegistry:didUpdatePushCredentials:forType: method. Don't create
     PKPushCredentails objects yourself.
     */
    
    /**
     Getting the Token
     */
    PKPushCredentials *credentials = nil;
//    credentials.token
//    credentials.type
     
    
    
#pragma mark -- Push Types
    
    /*
     Receive incoming Voice-over-IP (VoIP) push notification and use them
     to display the system call interface to the user.
     
     If your app provides Voice-over-IP(VoIP)phone services, you may use
     PushKit to handle incoming calls on user devices. PushKit provides
     an efficient way to manage calls that doesn't require your app to be
     running to receive calls. When it detects a call for a specific user,
     your server sends a push notification to the user's device with information
     about that call. Upon receiving the notification, the device wakes up
     your app and gives it time to notify the user and connect to your call
     service.
     
     For apps built using the iOS 13 SDK or later, PushKit requires you to
     use CallKit when handling VoIP calls. CallKit ensures that apps provides
     call-related services on a user's device work seamlessly together
     on the user's device, and respect features like Do Not Disturb.
     CallKit also operates the system's call-related UIs, including the
     incoming or outgoing call screens. Use CallKit to present these
     interfaces and manage interactions with them.
     
     ⚠️ If you are unable to support CallKit in your app, you cannot use
     PushKit to handle push notifications. Instead, configure your app's
     push notification support with the User Notifications framework.
     If you need to do work in response to an incoming notification --
     for example, to decrypt content -- use a notification service
     extension to perform that work. 
     */
    
    /**
     Create a Call Provider Object to Manage Calls in Your App
     
     VoIP apps must use CallKit to present the system's call-related
     interfaces. You present these interfaces using a CXProvider object,
     which manages user interactions for both incoming and outgoing
     calls. Create a provider object early in your app's life cycle
     and make it available to your app's call-related code.
     
     The following code example shows how to create a provider object
     and assign a custom delegate to it. Initialize the CXProvider
     object with a configuration object containing the details about
     your service. Assign one of your app's custom objects as a delegate,
     and use that object to respond to user actions and telephony-related
     changes.
     ============================================================
     // Configure the app's CallKit provider object.
     let config = CXProviderConfiguration(localizedName: "VoIP Service")
     config.supportsVideo = true
     config.supportedHandleTypes = [.phoneNumber]
     config.maximumCallsPerCallGroup = 1

     // Create the provider and attach the custom delegate object
     // used by the app to respond to updates.
     callProvider = CXProvider(configuration: config)
     callProvider?.setDelegate(callManager, queue: nil)
     ============================================================

     Each provider object represents a single instance of your app’s
     phone service and facilitates interactions with the system.
     Apps need only one provider object to manage phone calls for
     the current user. If your service allows multiple users or
     multiple accounts per user, you are responsible for mapping
     incoming calls to the appropriate user accounts.
     */
    
    /**
     Generate Push Notifications from Your Server
     
     Your servers handle most of the call-related work required
     to connect users. Each time the user opens your app on a
     device, create a connection from that app to your server.
     When the user initiates a phone call, use that connection
     to communicate the details of the call back to your server.
     Your server must then try to connect the call initiator
     with the call recipient. If the recipient's app is running
     and has an active connection with the server, communicate
     directly with the app using your existing connection. If
     the app is not running, generate a push notification to
     wake up the app.
     
     Each push notification consists of a device token and a
     payload with the details of the call. You bundle this
     information into an HTTP request, which you then send
     to Apple Push Notification service (APNs). PushKit provides
     the device token that you use as the target address for
     the user's device at configuration time.
     
     When configuring the HTTP request for VoIP push notifications,
     always configure your requests with the following information:
     •  Set the value of the apns-expiration header field to 0,
        or to only a few seconds. Doing so prevents the system from
        delivering the notification at a much later time.
     •  Include information about the incoming call to the JSON payload.
        For example, include the unique call identifier that your server
        uses to track the call. Your app can use this identifier to
        check in with the server later. You might also want to include
        information about the caller, so that you can display that
        information in the incoming call UI.
     
     https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server?language=objc
     
     https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns?language=objc
     */
    
    /**
     Respond to VoIP Push Notifications in Your App
     
     When one of your users initiates a phone call, your server must
     connect to your app on the recipient's device. If your server
     doesn't have an active network connection to the app, you can
     ask the app to check in by sending it a push notification.
     Construct the push notification request on your server and
     send it to APNs for delivery to the user's device. For VoIP
     push notifications, the system launches or wakes your app and
     delivers the notification to your app's PKPushRegistry object,
     which calls the pushRegistry:didReceiveIncomingPushWithPayload:
     forType:withCompletionHandler:method of its delegate. Use that
     method to display the incoming call UI and to establish a
     connection to your VoIP server.
     
     The following code example shows how you might process an
     incoming VoIP push notification in your pushRegistry:
     didReceiveIncomingPushWithPayload:forType:withCompletionHandler:
     method. After extracting the call data from the notification's
     payload dictionary, create a CXCallUpdate object and pass it to
     the reportNewIncomingCallWithUUID:update:completion: method of
     your app's CXProvider object. While CallKit processes your
     request, establish a connection to your VoIP server in parallel;
     you can always notify CallKit later if you run into problems.
     If CallKit handles the call successfully, the completion block
     creates some custom data structures to manage that call within
     the app.
     
     If the system allows your call to proceed, the
     reportNewIncomingCallWithUUID:update:completion: method
     executes its completion block and CallKit displays the
     incoming call interface. At that point, use the delegate
     of your CXProvider object to respond to user interactions
     with the interface. For example, use your delegate to
     respond when the user answers or ends the call.
     
     ⚠️ If you didn’t put caller information in your
     notification’s payload, call the reportCallWithUUID:updated:
     method of your app's provider object to update the calling
     interface. You can call that method at any time to update
     calls. For example, call it after your app fetches updated
     caller information from your VoIP server.
     */
    
    /**
     Respond to Call Hang Ups and Failures
     
     Many things can go wrong when connecting a VoIP call,
     and CallKit makes it easy to handle problems when they occur.
     
     •  If the person who initiated the call hangs up, use
        the network connection between your app and server to
        notify the app. In your app, call the
        reportCallWithUUID:endedAtDate:reason: method of its
        CXProvider object, specifying CXCallEndedReasonRemoteEnded
        as the reason for the end of the call. If the incoming call
        interface is onscreen, CallKit updates the interface to reflect
        the end of the call, and dismisses the interface.
     •  If the recipient of a call answers before the app
        establishes a connection to your server, don't fulfill
        the CXAnswerCallAction object sent to the
        provider:performAnswerCallAction: method of your delegate
        immediately. Instead, wait until you establish a connection
        and then fulfill the object. While it waits for your app to
        fulfill the request, the incoming call interface lets the
        user know that the call is connecting, but not yet ready.
     •  If your app fails to establish a connection to your server,
        call the reportCallWithUUID:endedAtDate:reason: method with
        the CXCallEndedReasonFailed option. If the incoming call
        interface is currently onscreen, the system updates it to
        indicate a failed call.

     After sending the initial push notification, don’t send
     additional push notifications to cancel the call or
     communicate new details to your app. Instead, communicate
     with the app directly over the network connection you
     established between it and your server. Using an existing
     network connection is generally faster than sending a
     push notification, and if network conditions are poor,
     APNs may be unable to deliver push notifications to the
     device anyway.
     */
    
    
#pragma mark -- PKPushPayload
    
    /**
     An object that contains information about a received
     PushKit notification.

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
