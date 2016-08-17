//
//  SDBranchDetailViewController.h
//

#import <UIKit/UIKit.h>

@interface SDBranchDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSManagedObjectID *managedObjectId;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITableView *detailTableView;

@end
