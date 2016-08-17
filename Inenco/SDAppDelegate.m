
//
//  SDAppDelegate.m
//  SignificantDates
//
//  Created by Chris Wagner on 5/14/12.
//

#import "SDAppDelegate.h"
#import "SDSyncEngine.h"
#import <Parse/Parse.h>
#import "Branch.h"



@implementation SDAppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[SDSyncEngine sharedEngine] registerNSManagedObjectClassToSync:[Branch class]];
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"inencoDB.sqlite"];
    
    [Parse setApplicationId:@"aTajV1CWI5MfiM7klxYFPvUuXSaSpCSuyIZ7MCh1"
                  clientKey:@"pzgLdaJoFes07Mv4pzdzaQvbNtanzBunnPVSq1fO"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",[paths objectAtIndex:0]);
return YES;
    }

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   // [[SDSyncEngine sharedEngine] startSync];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
 [MagicalRecord cleanUp];
}

@end
