//
//  SDClosesBranchViewController.h
//

#import <UIKit/UIKit.h>
//#import "SDSyncEngine.h"
#import <INTULocationManager/INTULocationManager.h>
#import <MapKit/MapKit.h>


@interface SDClosestBranchViewController : UIViewController


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UITextField *branchName;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *hours;
@property (strong, nonatomic) IBOutlet UITextField *contactNo;


@property (strong, nonatomic) IBOutlet NSArray *myArray;

@property (nonatomic, retain) NSArray *closestBranchIs;



@end
