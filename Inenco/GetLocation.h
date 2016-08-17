//
//  Markers.h


#import <Foundation/Foundation.h>
#import <CoreLocation/Corelocation.h>


@interface GetLocation : NSObject<CLLocationManagerDelegate>

{
    NSArray *_locations;
 
    
    
}


+(CLLocation *)closestLocation:(NSArray *)allLocations
               currentLocation: (CLLocation *)curlocation;



@property (nonatomic, retain) NSArray *locations;

@end
