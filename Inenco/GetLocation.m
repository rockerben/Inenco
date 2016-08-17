//
//  Markers.m


#import "GetLocation.h"
#import <MobileCoreServices/MobileCoreServices.h>



@implementation GetLocation

@synthesize locations = _locations;

- (id)init {
 
    if ((self = [super init])) {
        self.locations = [[NSArray alloc] init];
    }
    
    
    return self;
    
}

- (void) dealloc {
    self.locations = nil;
   // [super dealloc];
}

+(CLLocation *)closestLocation:(NSArray *)allLocations currentLocation:(CLLocation*)curlocation{
   // NSArray *allLocations; // this array contains all CLLocation objects for the locations from the API you use
    
    
    
    
    CLLocation *closestLocation;
    
    
    
    CLLocationDistance closestLocationDistance = -1;
    
    for (CLLocation *location in allLocations) {
        
        if (!closestLocation) {
            closestLocation = location;
            closestLocationDistance = [curlocation distanceFromLocation:location];
            continue;
        }
        
        CLLocationDistance currentDistance = [curlocation distanceFromLocation:location];
        
        if (currentDistance < closestLocationDistance) {
            closestLocation = location;
            closestLocationDistance = currentDistance;
           // NSString *locationName =
            
         
            
            
            
        }
    }

    return closestLocation;
    
    
}



@end

