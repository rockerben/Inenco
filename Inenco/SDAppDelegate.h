//
//  SDAppDelegate.h
//  SignificantDates
//
//  Created by Chris Wagner on 5/14/12.
//


// Notification names:
static NSString * const kPAWFilterDistanceChangeNotification = @"kPAWFilterDistanceChangeNotification";
static NSString * const kPAWLocationChangeNotification = @"kPAWLocationChangeNotification";
static NSString * const kPAWPostCreatedNotification = @"kPAWPostCreatedNotification";

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"


@interface SDAppDelegate : UIResponder <UIApplicationDelegate>
{
    
    
}
@property (strong, nonatomic) UIWindow *window;


@end
