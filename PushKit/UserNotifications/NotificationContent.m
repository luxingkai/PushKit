//
//  NotificationContent.m
//  PushKit
//
//  Created by tigerfly on 2020/12/13.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NotificationContent.h"
#import <UserNotifications/UserNotifications.h>
@interface NotificationContent ()

@end

@implementation NotificationContent

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Modify and examine the payload of a notification
     */
    
#pragma mark -- UNMutableNotificationContent
    
    /**
     The editable content for a notification
     
     Create a UNMutableNotificationContent object when you want to
     specify the payload for a local notification. Specifically,
     use this object to specify the title and message for an alert,
     the sound to play, or the value to assign to your app's badge.
     You might also provide details about how the system handles
     the notification. For example, you can specify a custom launch
     image and a thread identifier for visually grouping related
     notifications.
     
     After creating your content object, assign it to a
     UNNotificationRequest object, add a trigger condition, and
     schedule your notification. The trigger condition defines
     when the notification is delivered to the user. Listing 1
     shows the scheduling of a local notification that displays
     an alert and plays a sound after a delay of five seconds.
     The strings for the alert's title and body are stored in the
     app’s Localizable.strings file.
     ============================================================
     Listing 1 Creating the content for a local notification
     // Configure the notification's payload.
     UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
     content.title = [NSString localizedUserNotificationStringForKey:@"Hello!" arguments:nil];
     content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body"
                 arguments:nil];
     content.sound = [UNNotificationSound defaultSound];
      
     // Deliver the notification in five seconds.
     UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                 triggerWithTimeInterval:5 repeats:NO];
     UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                 content:content trigger:trigger];
      
     // Schedule the notification.
     UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
     [center addNotificationRequest:request];
     ============================================================
     
     ⚠️ Local notifications always result in user interactions,
     and the system ignores any interactions for which your app
     is not authorized.
     */
    
    /**
     Localizing the Alert Strings

     The strings you display in a notification alert should be
     localized for the current user. Although you can use the
     NSLocalizedString macros to load strings from your app’s
     resource files, a better option is to specify your string
     using the localizedUserNotificationStringForKey:arguments:
     method of NSString.
     The localizedUserNotificationStringForKey:arguments: method
     delays the loading of the localized string until the
     notification is delivered. Thus, if the user changes language
     settings before a notification is delivered, the alert text
     is updated to the user’s current language instead of the
     language that was set when the notification was scheduled.
     */
    
    /**
     Getting the Notification Data
     */
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
//    content.title
//    content.subtitle
//    content.body
//    content.badge
//    content.sound
//    content.launchImageName
//    content.userInfo
//    content.attachments
    
    /**
     Setting the Notification Summary
     */
//    content.summaryArgument
//    content.summaryArgumentCount
    
    /**
     Identifying the Content
     */
//    content.categoryIdentifier
//    content.threadIdentifier
//    content.targetContentIdentifier
    
    
    
#pragma mark -- UNNotificationContent

    /**
     The uneditable content of a notification
     
     A UNNotificaitonContent object contains the data associated
     with a notification. When your app receives a notification,
     the associated UNNotificationRequest objects contains an
     object of this type with the content that your app received.
     Use the content object to get the details of the notification,
     including the type of notification that was delivered, any
     custom data you stored in the userInfo dictionary before
     schedualing the notification, and any attachments.
     
     Don't create instances of this class directly. For remote
     notifications, the contents of this object are derived from
     the JSON payload that your server sends to the APNs server.
     For local notifictions, create a UNMutableNotificationContent
     object, and configure the contents of that object instead.
     */
    
    /**
     Getting the Notification Data
     */
//    content.title
//    content.subtitle
//    content.body
//    content.badge
//    content.sound
//    content.launchImageName
//    content.userInfo
//    content.attachments
    
    /**
     Setting the Notification Summary
     */
//    content.summaryArgumentCount
//    content.summaryArgument
    
    /**
     Identifying the Content
     */
//    content.categoryIdentifier
//    content.threadIdentifier
//    content.targetContentIdentifier
    
    
    
#pragma mark -- UNNotificationAttachment
    
    /**
     A media file associated with a notification.
     
     Create a UNNoficationAttachment object when you want to include audio,
     image, or video content together in an alert-based notification. When
     creating the UNNotificationAttachment object, the file you specify must
     be on disk, and the file format must be one of the supported types.
     
     You are responsible for supplying attachments before the system displays
     your notification's alert. For local notifications, add attachments when
     creating the notification's content. For remote notifications, use a
     notification service app extension to download the attachment files and
     then add them to the notification's content before delivery.
     
     The system validates attachments before displaying the associated
     notification. If you attach a file to a local notification request
     that is corrupted, invalid, or of an unsupported file type, the
     system doesn't schedule your request. For remote notifications,
     the system validates attachments after your notification service
     app extension finishes. Once validated, attached files are moved
     into the attachment data store so that they can be accessed by
     all of the appropriate processes. Attachments located inside an
     app’s bundle are copied instead of moved.
     */
    
    
    /**
     Supported File Types
     
     Table 1 lists the types of files you can include as an
     attachment and the supported file formats. The table also
     lists the maximum size allowed for attachments of each type.
     An image file may contain a static image or an animated image
     sequence.
     Table 1 Supported attachment file types
     ============================================================
     Attachment
     Audio
     
     Image
     
     Movie
     ============================================================
     Supported file types
     kUTTypeAudioInterchangeFileFormat
     kUTTypeWaveformAudio
     kUTTypeMP3
     kUTTypeMPEG4Audio
     
     kUTTypeJPEG
     kUTTypeGIF
     kUTTypePNG

     kUTTypeMPEG
     kUTTypeMPEG2Video
     kUTTypeMPEG4
     kUTTypeAVIMovie
     ============================================================
     Maximum size
     5 MB
     10 MB
     50 MB
     ============================================================

     When creating an attachment, you can specify optional details
     about how to present the thumbnail image for the image or movie.
     Use the UNNotificationAttachmentOptionsThumbnailClippingRectKey
     option to use only the specified portion of an image as a
     thumbnail. For animated images and movies, use the
     UNNotificationAttachmentOptionsThumbnailTimeKey option to
     select which frame to use for the thumbnail image.
     
     The amount of storage space allocated for attachments is
     limited for each app. To delete attachments, use the methods
     of the UNUserNotificationCenter class to remove the notification
     requests that contain those attachments.
     */
    
    /**
     Creating an Attachment
     
     + attachmentWithIdentifier:URL:options:error:
     Creates an attachment object from the specified file and options.
     
     UNNotificationAttachmentOptionsTypeHintKey
     A hint about an attachment’s file type.
     
     UNNotificationAttachmentOptionsThumbnailHiddenKey
     A Boolean value indicating whether the attachment’s thumbnail is hidden.
     
     UNNotificationAttachmentOptionsThumbnailClippingRectKey
     The clipping rectangle for a thumbnail image.
     
     UNNotificationAttachmentOptionsThumbnailTimeKey
     The frame number of an animation to use as a thumbnail image.
     */
    
    /**
     Getting the Attachment Contents
     
     identifier
     The unique identifier for the attachment.
     
     URL
     The URL of the file for this attachment.
     
     type
     The UTI type of the attachment.
     */
    
    
#pragma mark -- UNNotificationSound
    
    /**
     The sound played upon delivery of a notification.
     
     Create a UNNotificationSound object when you want the delivery of your
     notification to be accompanied by a specific sound. To play the default
     system sound, create your sound object using the defaultSound method.
     If you want to play a custom sound, create a new sound object and
     specify the name of the audio file that you want to play.
     
     For local notifications, assign the sound object to the sound property
     of your UNMutableNotificationContent object. For a remote notification,
     assign the name of your sound file to the sound key in the aps dictionary.
     You can also use a notification service app extension to add a
     sound file to a notification shortly before delivery. In your
     extension, create a UNNotificationSound object and add it to
     your notification content in the same way that you would for a
     local notification.
     
     Audio files must already be on the user’s device before they
     can be played. If you use a predefined set of sounds for your
     notifications, include the audio files in your app’s bundle.
     For all other sounds, the UNNotificationSound object looks
     only in the following locations:
     •  The /Library/Sounds directory of the app's container directory.
     •  The /Library/Sounds directory of one of the app's shared group
        container directories.
     •  The main bundle of the current executable.
     */
    
    /**
     Prepare Sound Resources

     The system sound facility plays custom alert sounds, so they
     must be in one of the following audio data formats:

     •  Linear PCM
     •  MA4 (IMA/ADPCM)
     •  µLaw
     •  aLaw
     
     You can package the audio data in an aiff, wav, or caf file.
     Sound files must be less than 30 seconds in length. If the
     sound file is longer than 30 seconds, the system plays the
     default sound instead.
     
     You can use the afconvert command-line tool to convert sounds.
     For example, to convert the system sound Submarine.aiff to
     IMA4 audio in a CAF file, use the following command in Terminal:
     
     afconvert /System/Library/Sounds/Submarine.aiff ~/Desktop/sub.caf -d ima4 -f caff -v
     */
 
    /**
     Creating Notification Sounds
     */
    
    UNNotificationSound *sound = [UNNotificationSound defaultSound];
//    UNNotificationSound soundNamed:<#(nonnull UNNotificationSoundName)#>
    
    /**
     Getting Critical Sounds
     */
    [UNNotificationSound defaultCriticalSound];
//    UNNotificationSound defaultCriticalSoundWithAudioVolume:<#(float)#>
//    UNNotificationSound criticalSoundNamed:<#(nonnull UNNotificationSoundName)#>
//    UNNotificationSound criticalSoundNamed:<#(nonnull UNNotificationSoundName)#> withAudioVolume:<#(float)#>
    

    
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
