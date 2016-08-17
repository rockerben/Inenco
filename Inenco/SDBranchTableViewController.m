//
//  SDBranchTableViewController.m
//
//

#import "SDBranchTableViewController.h"
#import "SDBranchDetailViewController.h"
#import "SDAddBranchViewController.h"

#import "SDCoreDataController.h"
#import "SDTableViewCell.h"

#import "Branch.h"
#import "SDSyncEngine.h"



@interface SDBranchTableViewController ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end

@implementation SDBranchTableViewController

@synthesize dateFormatter;
@synthesize managedObjectContext;

@synthesize entityName;
@synthesize branches;

@synthesize filteredBranchArray;
@synthesize branchSearchBar;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadRecordsFromCoreData {
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext reset];
        NSError *error = nil;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:self.entityName];
        [request setSortDescriptors:[NSArray arrayWithObject:
                                     [NSSortDescriptor sortDescriptorWithKey:@"branchName" ascending:YES]]];
        // 1
        [request setPredicate:[NSPredicate predicateWithFormat:@"syncStatus != %d", SDObjectDeleted]];
        self.branches = [self.managedObjectContext executeFetchRequest:request error:&error];
    }];
   
    
  
    
    
    
  //  self.branches = [Branch MR_findAllSortedBy:@"branchName" ascending:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //[self.searchDisplayController.searchResultsTableView registerNib:[UINib nibWithNibName:@"BranchCell" bundle:nil] forCellReuseIdentifier:@"InviteCell"];
    //[self.tableView registerNib:[UINib nibWithNibName:@"InviteTableViewCell" bundle:nil] forCellReuseIdentifier:@"inviteCell"];

    [self.searchDisplayController.searchResultsTableView setRowHeight:self.tableView.rowHeight];
    
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [self loadRecordsFromCoreData];

    
    // Initialize the filteredBranchArray with a capacity equal to the branches capacity
    self.filteredBranchArray = [NSMutableArray arrayWithCapacity:[branches count]];
    
    [[SDSyncEngine sharedEngine] startSync];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self checkSyncStatus];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"SDSyncEngineSyncCompleted" object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self loadRecordsFromCoreData];
        [self.tableView reloadData];
    }];
    [[SDSyncEngine sharedEngine] addObserver:self forKeyPath:@"syncInProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SDSyncEngineSyncCompleted" object:nil];
    [[SDSyncEngine sharedEngine] removeObserver:self forKeyPath:@"syncInProgress"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *date = [self.branches objectAtIndex:indexPath.row];
        [self.managedObjectContext performBlockAndWait:^{
            // 1
            //the following test verifies if the object actually exists on the server
            if ([[date valueForKey:@"objectId"] isEqualToString:@""] ||
                [date valueForKey:@"objectId"] == nil) {
                
                [self.managedObjectContext deleteObject:date];
                
            } else {
                
                [date setValue:[NSNumber numberWithInt:SDObjectDeleted] forKey:@"syncStatus"];
                
            }
            NSError *error = nil;
            BOOL saved = [self.managedObjectContext save:&error];
            if (!saved) {
                NSLog(@"Error saving main context: %@", error);
            }
            
            [[SDCoreDataController sharedInstance] saveMasterContext];
            [self loadRecordsFromCoreData];
            [self.tableView reloadData];
            [[SDSyncEngine sharedEngine] startSync];
        }];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredBranchArray count];
    } else {
        // Return the number of rows in the section.
        return [self.branches count];
    }
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     SDTableViewCell *cell = nil;
    
    if ([self.entityName isEqualToString:@"Branch"]) {
        static NSString *CellIdentifier = @"BranchCell";
       
        
        
        
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
       }else{
            cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
        
        
        
        
        
        
        
        
        
        Branch *branch = nil;
        
        // Check to see whether the normal table or search results table is being displayed and set the Branch object from the appropriate array
        
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            branch = [self.filteredBranchArray objectAtIndex:indexPath.row];
            //branch = [self.branches objectAtIndex:indexPath.row];
            NSLog(@"%@", branch.branchName);
        } else {
            branch = [self.branches objectAtIndex:indexPath.row];
            
        }
        
        
        
        cell.nameLabel.text = branch.branchName;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
     // cell.dateLabel.text = [self.dateFormatter stringFromDate:order.date];
     //  if (order.image != nil) {
     //       UIImage *image = [UIImage imageWithData:order.image];
     //       cell.imageView.image = image;
     //   } else {
     //       cell.imageView.image = nil;
     //   }
    
    }
    
    return cell;
}
    


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowBranchDetailSegue"]) {
        
        SDBranchDetailViewController *dateDetailViewController = segue.destinationViewController;
        SDTableViewCell *cell = (SDTableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Branch *branchDetails = [self.branches objectAtIndex:indexPath.row];
        dateDetailViewController.managedObjectId =branchDetails.objectID;
        
    } else if ([segue.identifier isEqualToString:@"ShowAddBranchViewSegue"]) {
        SDAddBranchViewController *addBranchViewController = segue.destinationViewController;
        [addBranchViewController setAddBranchCompletionBlock:^{
            [self loadRecordsFromCoreData];
            [self.tableView reloadData];
            [[SDSyncEngine sharedEngine] startSync];
        }];
        
    }
}

- (IBAction)refreshButtonTouched:(id)sender {
    [[SDSyncEngine sharedEngine] startSync];
}

- (void)checkSyncStatus {
    if ([[SDSyncEngine sharedEngine] syncInProgress]) {
        [self replaceRefreshButtonWithActivityIndicator];
    } else {
        [self removeActivityIndicatorFromRefreshButton];
    }
}

- (void)replaceRefreshButtonWithActivityIndicator {
    //    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    [activityIndicator startAnimating];
    UIBarButtonItem *activityItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    self.navigationItem.leftBarButtonItem = activityItem;
}

- (void)removeActivityIndicatorFromRefreshButton {
    self.navigationItem.leftBarButtonItem = self.refreshButton;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"syncInProgress"]) {
        [self checkSyncStatus];
    }
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredBranchArray removeAllObjects];
    
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.branchName contains[c] %@",searchText];
    filteredBranchArray = [NSMutableArray arrayWithArray:[self.branches filteredArrayUsingPredicate:predicate]];
   NSLog(@"%@", filteredBranchArray);
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
