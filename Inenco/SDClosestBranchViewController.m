//
//  SDClosestBranchViewController.m
//

#import "SDClosestBranchViewController.h"
#import "Branch.h"
#import "GetLocation.h"
#import "Inenco-Swift.h"


#define METERS_PER_MILE 1609.344

@interface SDClosestBranchViewController ()


@end

@implementation SDClosestBranchViewController

@synthesize branchName;
@synthesize address;
@synthesize email;
@synthesize hours;
@synthesize contactNo;

@synthesize myArray;
@synthesize mapView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //[mapView setDelegate:self];< done in storyBoard
    
    
    
    NSMutableArray *branchLocations = [[NSMutableArray alloc] init];
    
    //for in loop of markers array, place lat and long to a clcoordinate2d obj as below
    
    for (Branch *branch in self.myArray) {
        
        CLLocationDegrees Lat = [branch.latitude doubleValue] ;
        CLLocationDegrees Long = [branch.longitude doubleValue];
        
        CLLocation *branchLocation = [[CLLocation alloc] initWithLatitude:Lat   longitude:Long];
        [branchLocations addObject:branchLocation];
        
    }
    
    NSArray *allBranches = [NSArray arrayWithArray:branchLocations];
    
    
    __weak __typeof(self) weakSelf = self;
    INTULocationManager *locMgr = [INTULocationManager sharedInstance];
    [locMgr requestLocationWithDesiredAccuracy:INTULocationAccuracyCity
                                       timeout:10.0
                          delayUntilAuthorized:YES  // This parameter is optional, defaults to NO if omitted
                                         block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
                                             
                                             __typeof(weakSelf) strongSelf = weakSelf;
                                             
                                             if (status == INTULocationStatusSuccess) {
                                                 
                                                 // Request succeeded, meaning achievedAccuracy is at least the requested accuracy, and
                                                 // currentLocation contains the device's current location.
                                                 
                                                 
                                                 CLLocation * closestBranch = [GetLocation closestLocation:allBranches currentLocation: currentLocation];
                                                 
                                                 
                                                 NSString *longStr = [NSString stringWithFormat:@"%f", closestBranch.coordinate.longitude];
                                                 NSString *latStr = [NSString stringWithFormat:@"%f", closestBranch.coordinate.latitude];
                                       
                                                 
                                                 if ([longStr length] > 0) {
                                                     if ([longStr hasSuffix:@"0"]){
                                                          longStr = [longStr substringToIndex:[longStr length] - 1];
                                                     }
                                                     
                                                 };
                                                 
                                                 if ([latStr length] > 0) {
                                                     if ([latStr hasSuffix:@"0"]){
                                                         latStr = [latStr substringToIndex:[latStr length] - 1];
                                                     }
                                                     
                                                 };
                                                 
                                                 
                                                 CLLocationCoordinate2D  coordinate;
                                                 coordinate.longitude = closestBranch.coordinate.longitude;
                                                 coordinate.latitude =  closestBranch.coordinate.latitude;
                                                 
                                                 
                                                 // 2
                                                 MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
                                                 
                                                 // 3
                                                 [mapView setRegion:viewRegion animated:YES];
                                                 
                                                 
                                                 //NSString *addressString = [NSString stringWithFormat:@"AVENUE WHYALLA"];
                                                 
                                                 
                                                 NSPredicate * findPred = [NSPredicate predicateWithFormat:@"(latitude CONTAINS %@) and (longitude CONTAINS %@)", latStr, longStr];
                                                 //NSPredicate * findPred = [NSPredicate predicateWithFormat:@"(latitude IN %@) OR (longitude IN %@)", latStr, longStr];
                                                 
                                                 //NSPredicate * findPred = [NSPredicate predicateWithFormat:@"longitude  CONTAINS[cd] %@",longStr];
                                                 
                                                 //NSPredicate * findPred = [NSPredicate predicateWithFormat:@"address CONTAINS[c] %@", addressString];
                                                 
                                                 //NSMutableArray *arr2 = [NSMutableArray arrayWithArray:[Branch findAll]];
                                                 
                                                 //NSLog(@"%@",arr2);
                                                 
                                                 Branch *branch1  = [Branch MR_findFirstWithPredicate:findPred];
                                                 
        
                                                if (branch1)
                                                {
                                                 NSLog(@"%@",latStr);
                                                    NSLog(@"%@",branch1.latitude);
                                                    NSLog(@"%@",branch1.longitude);
                                                    
                                                    NSLog(@"%@",longStr);
                                                 NSLog(@"%@",branch1.branchName);
                                                 NSLog(@"%@",branch1.address);
                                                 NSLog(@"%@",branch1.email);
                                                 NSLog(@"%@",branch1.fax);
                                                 NSLog(@"%@",branch1.hours);
                                                 NSLog(@"%@",branch1.phone);
                                                };
                                                 NSLog(@"%@",latStr);
                                                 NSLog(@"%@",branch1.latitude);
                                                 NSLog(@"%@",branch1.longitude);
                                                 
                                                 NSLog(@"%@",longStr);

                                                 strongSelf.branchName.text = [NSString stringWithFormat: @"%@", branch1.branchName];
                                                 strongSelf.address.text = [NSString stringWithFormat: @"%@", branch1.address];
                                                 strongSelf.email.text = [NSString stringWithFormat: @"%@", branch1.email];
                                                 strongSelf.hours.text = [NSString stringWithFormat: @"%@", branch1.hours];
                                                 strongSelf.contactNo.text = [NSString stringWithFormat: @"%@", branch1.phone];
                                                 
                                                 
                                                 //map shit
                                                 
                                                 BranchAnnotations * annotation = [[BranchAnnotations alloc] initWithTitle:[NSString stringWithFormat: @"%@", branch1.branchName] locationName:[NSString stringWithFormat: @"%@", branch1.address] discipline:@"Discipline" coordinate:coordinate];
                                                 
                                                 [mapView addAnnotation:annotation];
                                                 
                                                 
                                             }
                                             else if (status == INTULocationStatusTimedOut) {
                                                 // Wasn't able to locate the user with the requested accuracy within the timeout interval.
                                                 // However, currentLocation contains the best location available (if any) as of right now,
                                                 // and achievedAccuracy has info on the accuracy/recency of the location in currentLocation.
                                                 
                                                 NSLog(@"%f",currentLocation.coordinate.longitude);
                                                 NSLog(@"%f",currentLocation.coordinate.latitude);
                                                 
                                                 
                                             }
                                             else {
                                                 // An error occurred, more info is available by looking at the specific status returned.
                                                 NSLog(@"error retrieving location");
                                                 
                                                 
                                             }
                                         }];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidUnload {
    [self setBranchName:nil];
    [self setAddress:nil];
    [self setEmail:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
