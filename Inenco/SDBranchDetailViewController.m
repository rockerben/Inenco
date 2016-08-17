//
//  SDBranchDetailViewController.m
//

#import "SDBranchDetailViewController.h"
#import "Branch.h"
#import "SDCoreDataController.h"

//enum SDDateType {
  //  SDDateHoliday,
    //SDDateBirthday
   // };

typedef enum {
    SDBranchNameCell = 0,
    SDBranchAddressCell = 1,
    SDBranchPhoneCell = 2,
    SDBranchWebsiteCell = 3
    } SDBranchCell;



@interface SDBranchDetailViewController ()

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObject *managedObject;

//@property enum SDDateType dateType;

@end

@implementation SDBranchDetailViewController
@synthesize context;
@synthesize managedObject;
//@synthesize dateType;
@synthesize managedObjectId;
@synthesize imageView;
@synthesize detailTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.context = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.managedObject = [context objectWithID:self.managedObjectId];
    
    self.title = [self.managedObject valueForKey:@"branchName"];
    self.imageView.image = [UIImage imageWithData:[self.managedObject valueForKey:@"image"]];
    //if ([self.managedObject isKindOfClass:[Branch class]]) {
    //    self.dateType = SDDateHoliday;
   // }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setDetailTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DateDetailViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
        Branch *newBranch = (Branch *)self.managedObject;
    if (indexPath.row == SDBranchNameCell) {
        cell.textLabel.text = @"Date";
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        cell.detailTextLabel.text = [dateFormatter stringFromDate:newBranch.date];
    } else if (indexPath.row == SDBranchAddressCell) {
        cell.textLabel.text = @"Address";
        cell.detailTextLabel.text = newBranch.address;
    } else if (indexPath.row == SDBranchPhoneCell) {
        cell.textLabel.text = @"Phone";
        //cell.detailTextLabel.text = newBranch.phone;
        // } else if (indexPath.row == SDHolidayWikipediaCell) {
        //     cell.textLabel.text = @"Wikipedia";
        //     if (![holiday.wikipediaLink isEqualToString:@""]) {
        //          cell.detailTextLabel.text = @"View on Wikipedia";
        //      } else {
        //          cell.detailTextLabel.text = @"Search by Name";
        //}
    }
    

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
     [self performSegueWithIdentifier:@"ShowOrderAddViewSegue" sender:self];
    
    }
    
  //  if (self.dateType == SDDateHoliday) {
       // OrderHeader *newOrder = (OrderHeader *)self.managedObject;
       // if (indexPath.row == SDHolidayWikipediaCell) {
            
           // BOOL validURL = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:holiday.wikipediaLink]];
           // if (!validURL) {
           //     NSString *urlString = [NSString
             //                          stringWithFormat:@"http://m.//wikipedia.org/wiki/%@", holiday.name];
            //    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
              //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    //        }
 //       }
 //   } else if (self.dateType == SDDateBirthday) {
   //     Birthday *birthday = (Birthday *)self.managedObject;
   //     if (indexPath.row == SDBirthdayFacebookCell) {
   //         if (birthday.facebook) {
    //            NSString *urlString = [NSString
         //                              stringWithFormat:@"http://facebook.com/%@", birthday.facebook];
            //    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
          //      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        //    } else {
         //       NSString *urlString = [NSString
          //                             stringWithFormat:@"https://www.facebook.com/search/results.php?q=%@", birthday.name];
         //       urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];

       //     }
    //    }
  //  }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 4;
}



@end
