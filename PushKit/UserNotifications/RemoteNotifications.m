//
//  RemoteNotifications.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "RemoteNotifications.h"

@interface RemoteNotifications ()

@end

@implementation RemoteNotifications

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
#pragma mark -- Setting Up a Remote Notification Server

    /**
     Set up a server to generate notifications and push
     them to user devices.

     Use remote notifications (also known as push notifications)
     to push small amounts of data to devices on which your app
     is installed, even when your app isn't running. Apps use
     notifications to keep the user informed. For example, a
     messaging service sends remote notifications when new
     messages arrive for the user.
     
     The delivery of remote notifications involves several
     key components:
     •  Your company's server (known as the provider server)
     •  Apple Push Notification service (APNs)
     •  The user's device
     •  Your app (running on the user's device).
     
     Remote notifications begin with your company’s server.
     You decide when you want to send notifications to your
     users. When it's time to send a notification, you
     generate a request containing the notification data and
     a unique identifier for the user's device. You then
     forward your request to APNs, which handles the delivery
     of the notification to the user’s device. Upon receipt
     of the notification, the operating system on the user's
     device handles any user interactions and delivers the
     notification to your app.
     file:///Users/tigerfly/Desktop/PushKit/PushKit/4ebaf4d8-031d-4eb5-b975-07373dfa6eb6.png
     
     You're responsible for setting up a provider server
     (or servers) and for configuring your app to handle
     notifications on the user's device. (Apple manages
     everything in between, including the presentation of
     notifications to the user.) You must also have an app
     running on the user's device that can communicate
     with your server and provide needed information. For
     information on how to configure your app to handle
     remote notifications, see Registering Your App with APNs.
     */
    
    /**
     Build Custom Infrastructure for Notifications
     
     Here are the main tasks for setting up a remote notification
     server. How you implement these tasks depends on your
     infrastructure, and you are free to use whatever
     technologies that are appropriate for your company.
     
     •  Write code to receive device tokens from instances of
        your app running on user devices, and to associate those
        tokens with your users' accounts. See https://developer.apple.com/documentation/usernotifications/registering_your_app_with_apns?language=objc.
     •  Determine when to send notifications to your users, and
        write code to generate notification payloads. See https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification?language=objc.
     •  Manage a connection to APNs using HTTP/2 and TLS.
        See https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns?language=objc.
     •  Write code to generate POST requests containing your payloads,
        and send those requests over your HTTP/2 connection. See
        https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns?language=objc..
     •  For token-based authentication, regenerate your token
        periodically. See https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/establishing_a_token-based_connection_to_apns?language=objc.
     */
    
    /**
     Establish a Trusted Connection to APNs
     
     Communication between your provider server and APNs must
     take place over a secure connection. Creating that connection
     requires installing a GeoTrust Global CA root certificate on
     each of your provider servers. If your provider server runs
     macOS, this root certificate is in the keychain by default.
     On other systems, you might need to install this certificate
     yourself. You can download this certificate from the GeoTrust
     Root Certificates website.
     
     To send notifications, your provider server must establish
     either token-based or certificate-based trust with APNs
     using HTTP/2 and TLS. Both techniques have advantages and
     disadvantages, so decide which technique is best suited for
     your company.
     
     •  To set up token-based trust with APNs, see
        https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/establishing_a_token-based_connection_to_apns?language=objc.
     •  To set up certificate-based trust with APNs, see
        https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/establishing_a_certificate-based_connection_to_apns?language=objc.
     
     */
    
    /**
     Understand What APNs Provides
     
     APNs makes every effort to deliver your notifications,
     and to deliver them with the best user experience:
     •  APNs manages an accredited, encrypted, and persistent IP
        connection to the user’s device.
     •  APNs can store notifications for a device that is currently
        offline. Stored notifications are forwarded, when the
        device become online later on.
     •  APNs can coalesce notifications with the same bundle ID.
     */
    
    
    /**
     Server Tasks
     
     Generating a Remote Notification
     https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification?language=objc
     
     Sending Notification Requests to APNs
     https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns?language=objc
     
     Handling Notification Responses from APNs
     https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/handling_notification_responses_from_apns?language=objc
     
     Pushing Background Updates to Your App
     https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app?language=objc
     */
    
    
    
    
#pragma mark -- Registering Your App with APNs

    /**
     Communicate with Apple Push Notification service
     (APNs) and receive a unique device token that identifies
     your app.
     
     Apple Push Notification service (APNs) must know
     the address of a user's device before it can send
     notifications to that device. This address takes the
     form of a device token unique to both the device and
     your app. At launch time, your app communicates with
     APNs and receives its device token, which you then
     forward to your provider server. Your server includes
     that token with any notifications it sends.
     
     ⚠️ The device token for one app cannot be used for
     another app, even when both apps are installed on
     the same device. Both apps must request their own
     unique device token and forward it to your provider
     server.
     */
    
    /**
     Enable the Push Notifications Capability
     
     To add the required entitlements to your app, enable
     the Push Notifications capability in your Xcode project,
     as shown in Figure 1. Enabling this option in iOS adds
     the APS Environment Entitlement to the app. In macOS,
     it adds the APS Environment (macOS) Entitlement. See
     Enable push notifications in Xcode help for more information.
     
     Figure 1 Enabling the push notifications capability
     file:///Users/tigerfly/Desktop/PushKit/PushKit/f3327ebb-70be-4a12-9a76-b1a8badc0cd0.pngfifle
     
     ⚠️ In your developer account, also enable the push
     notification service for the App ID assigned to your
     project. For more information about configuring your
     developer account, go to your Developer Account page.
     */
    
    /**
     Register Your App and Retrieve Your App's Device Token
     
     Register your app with APNs and receive a globally unique
     device token, which is effectively the address of your app
     on the current device. Your provider server must have this
     token before it can deliver notifications to the device.
     
     You register your app and receive your device token each time
     your app launches using Apple-provided APIs. The registration
     process is similar across platforms:
     •  In iOS and tvOS, call the registerForRemoteNotifications
     method of UIApplication to request the device token. Upon
     successful registration, you receive the token in your app
     delegate’s application:didRegisterForRemoteNotificationsWithDeviceToken:
     method.
     •  In macOS, call the registerForRemoteNotifications method
     of NSApplication to request the device token. Upon successful
     registration, you receive the token in your app delegate’s application:didRegisterForRemoteNotificationsWithDeviceToken:
     method.
        
     In addition to handling successful registrations with APNs,
     be prepared to handle unsuccessful registrations by implementing
     the application:didFailToRegisterForRemoteNotificationsWithError:
     method. Registration might fail if the user’s device isn't
     connected to the network, if the APNs server is unreachable
     for any reason, or if the app doesn’t have the proper code-signing
     entitlement. When a failure occurs, set a flag and try to
     register again at a later time.
     
     Listing 1 shows a sample implementation of the iOS app
     delegate methods needed to register for remote notifications
     and receive the corresponding token. The sendDeviceTokenToServer
     method is a custom method that the app uses to send the data
     to its provider server.

     Listing 1 Communicating with APNs at launch time
     ===========================================================
     func application(_ application: UIApplication,
                didFinishLaunchingWithOptions launchOptions:
                [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
                    
        UIApplication.shared.registerForRemoteNotifications()
        return true
     }

     func application(_ application: UIApplication,
                 didRegisterForRemoteNotificationsWithDeviceToken
                     deviceToken: Data) {
        self.sendDeviceTokenToServer(data: deviceToken)
     }

     func application(_ application: UIApplication,
                 didFailToRegisterForRemoteNotificationsWithError
                     error: Error) {
        // Try again later.
     }
     ===========================================================

     ⚠️ Never cache device tokens in local storage. APNs issues
     a new token when the user restores a device from a backup,
     when the user installs your app on a new device, and when
     the user reinstalls the operating system. If you ask the
     system to provide the token each time, you are guaranteed
     to get an up-to-date token.
     */
    
    
    /**
     Forward Tokens to Your Provider Server

     Upon receiving a device token, open a network connection
     from your app to your provider server. Securely forward
     the device token and any other information you need to
     identify the specific user to your server. For example,
     you might include the user's login name or something that
     connects them to your service. Encrypt any information you
     send over the network.
     
     On your provider server, store tokens in a secure place
     where you can access them to send notifications. When
     generating notifications, your server must be able to send
     notifications to specific devices. So if notifications
     are linked to a user's account, store device tokens with
     the user's account information. Because a user can have
     multiple devices, be prepared to handle multiple device
     tokens.
     */
    
    
#pragma mark -- Sending Push Notifications Using Command-Line Tools
   
    /**
     Use basic macOS command-line tools to send push notifications
     to Apple Push Notification service(APNs).
     
     Testing your APNs connection and configuration by writing a
     test app can be effort intensive and time consuming. The command-
     line tools deescribed below provide a quick way to test your
     setup with APNs in a nonproduction-quality test suite or app.
     
     Before you begin, verify that:
     •  Your target device is unlocked and connected to the internet.
     •  Your app is open and in the foreground.
     */
    
    /**
     Send a Push Notification Using a Certificate
     
     What you'll need:
     •  A DER-encoded certificate from WWDR to connect to the APNs
        sandbox. For detail on how to set up certificate-based
        trust with APNs, see https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/establishing_a_certificate-based_connection_to_apns?language=objc
     •  The PEM-encoded private key, without a password, used to generate
        the above certificate. The private key is generated by the keychain
        app when you create a certificate signing request (CSR). To learn
        more, see https://help.apple.com/developer-account/#/devbfa00fef7
     •  Your App ID. To learn more about App IDs, see
        https://help.apple.com/developer-account/#/dev1b35d6f83
     •  The device token from your app, as a hexadecima-encoded ASCII string.
        To learn more about device tokens, see  https://developer.apple.com/documentation/usernotifications/registering_your_app_with_apns?language=objc
     
     Start by launching the Terminal app in the most recent macOS version.
     Then set these shell variables:
     ============================================================
     CERTIFICATE_FILE_NAME=path to the certificate file
     CERTIFICATE_KEY_FILE_NAME=path to the private key file
     TOPIC=App ID
     DEVICE_TOKEN=device token for your app
     APNS_HOST_NAME=api.sandbox.push.apple.com
     ============================================================

     Test that you can use your certificate to connect to APNs using
     this command:
     ============================================================
     % openssl s_client -connect "${APNS_HOST_NAME}":443 -cert "${CERTIFICATE_FILE_NAME}" -certform DER -key "${CERTIFICATE_KEY_FILE_NAME}" -keyformat PEM
     ============================================================
     
     
     Then send a push notification using this command:
     ============================================================
     % curl -v --header "apns-topic: ${TOPIC}" --header "apns-push-type: alert" --cert "${CERTIFICATE_FILE_NAME}" --cert-type DER --key "${CERTIFICATE_KEY_FILE_NAME}" --key-type PEM --data '{"aps":{"alert":"test"}}' --http2  https://${APNS_HOST_NAME}/3/device/${DEVICE_TOKEN}
     ============================================================

     The result is an HTTP status of 200 (request succeeded).
     A notification with the text “test” appears on your destination device.
     */
    
    /**
     Send a Push Notification Using a Token
     
     What you'll need:
     •  Your Team ID. For more information, see
        https://help.apple.com/developer-account/#/dev55c3c710c
     •  Your key identifier for APNs. For more information, see
        https://help.apple.com/developer-account/#/dev646934554
     •  The PEN-encoded private key, without a password,associated
        with the above key identifier. To learn more about downloading
        keys, see https://help.apple.com/developer-account/#/dev3a82eef1c
     •  Your App ID. To learn more about App IDs, see
        https://help.apple.com/developer-account/#/dev1b35d6f83
     •  The device token from your app, as a hexadecimal-encoded ASCII
        string. To learn more about device tokens, see
        https://developer.apple.com/documentation/usernotifications/registering_your_app_with_apns?language=objc
     
     Start by launching the Terminal app in the most recent macOS
     version. Then set these shell variables:
     ============================================================
     TEAM_ID=Team ID
     TOKEN_KEY_FILE_NAME=path to the private key file
     AUTH_KEY_ID=your key identifier
     TOPIC=App ID
     DEVICE_TOKEN=device token for your app
     APNS_HOST_NAME=api.sandbox.push.apple.com
     ============================================================

     Test that you can connect to APNs using this command:
     ============================================================
     % openssl s_client -connect "${APNS_HOST_NAME}":443
     ============================================================

     Set these additional shell variables just before sending a push notification:
     ============================================================
     JWT_ISSUE_TIME=$(date +%s)
     JWT_HEADER=$(printf '{ "alg": "ES256", "kid": "%s" }' "${AUTH_KEY_ID}" | openssl base64 -e -A | tr -- '+/' '-_' | tr -d =)
     JWT_CLAIMS=$(printf '{ "iss": "%s", "iat": %d }' "${TEAM_ID}" "${JWT_ISSUE_TIME}" | openssl base64 -e -A | tr -- '+/' '-_' | tr -d =)
     JWT_HEADER_CLAIMS="${JWT_HEADER}.${JWT_CLAIMS}"
     JWT_SIGNED_HEADER_CLAIMS=$(printf "${JWT_HEADER_CLAIMS}" | openssl dgst -binary -sha256 -sign "${TOKEN_KEY_FILE_NAME}" | openssl base64 -e -A | tr -- '+/' '-_' | tr -d =)
     AUTHENTICATION_TOKEN="${JWT_HEADER}.${JWT_CLAIMS}.${JWT_SIGNED_HEADER_CLAIMS}"
     ============================================================

     Send the push notification using this command:
     ============================================================
     % curl -v --header "apns-topic: $TOPIC" --header "apns-push-type: alert" --header "authorization: bearer $AUTHENTICATION_TOKEN" --data '{"aps":{"alert":"test"}}' --http2 https://${APNS_HOST_NAME}/3/device/${DEVICE_TOKEN}
     ============================================================

     The result is an HTTP status of 200 (request succeeded).
     A notification with the text “test” appears on your destination
     device.
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
