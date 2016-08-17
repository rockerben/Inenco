//
//  SDOrderDetailViewController.m
//

#import "INMainViewController.h"
#import "SDClosestBranchViewController.h"

#import "MarkersParser.h"
#import "Markers.h"


typedef enum {
    SDFirstCell = 0,
    SDSecondCell = 1,
    SDThirdCell = 2,
    SDFourthCell = 3
    } SDMenuCell;

@interface INMainViewController ()

@end

@implementation INMainViewController
@synthesize imageView;
@synthesize detailTableView;
@synthesize markers = _markers;


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
    
    [self.detailTableView setBackgroundView:nil];
    [self.detailTableView setBackgroundColor:[UIColor clearColor]];
    self.detailTableView.separatorColor = [UIColor clearColor];
    
    self.markers = [MarkersParser loadMarkers];
    
    
   
    
    
}


- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
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
    static NSString *CellIdentifier = @"MainViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
        if (indexPath.row == SDFirstCell) {
            cell.textLabel.text = @"Date";
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterLongStyle];
            [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
          
        } else if (indexPath.row == SDSecondCell) {
            cell.textLabel.text = @"Details";
          
        } else if (indexPath.row == SDThirdCell) {
            cell.textLabel.text = @"Observed By";
        } else if (indexPath.row == SDFourthCell) {
            cell.textLabel.text = @"Observed By";
 
             }
    
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == SDThirdCell) {
       
        [self performSegueWithIdentifier:@"ShowClosestBranchSegue" sender:self];
        
    } else
    
    if (indexPath.row == SDFourthCell) {
     [self performSegueWithIdentifier:@"ShowBranchMainViewSegue" sender:self];
       
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ShowClosestBranchSegue"]){
       // UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        
        
        SDClosestBranchViewController *controller = [segue destinationViewController];
         NSLog(@"prepareForSegue: %@", segue.identifier);
               controller.myArray = self.markers.branches;
        
       //  NSLog(@"%@",controller.nameTextField.text);
        NSLog(@"%@",controller.myArray);
    }
}

- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSInteger rows = 0;
    //        rows = 4;
    
    return 4;
}




@end
