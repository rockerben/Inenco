//
//  SDBranchTableViewController.h
//

#import <UIKit/UIKit.h>

@interface SDBranchTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *branches;
@property (nonatomic, strong) NSString *entityName;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

@property (strong,nonatomic) NSMutableArray *filteredBranchArray;
@property IBOutlet UISearchBar *branchSearchBar;

- (IBAction)refreshButtonTouched:(id)sender;

@end
