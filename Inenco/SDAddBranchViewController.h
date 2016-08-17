//
//  SDAddBranchViewController.h
//

#import <UIKit/UIKit.h>
#import "SDSyncEngine.h"

@interface SDAddBranchViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *option1TextField;
@property (strong, nonatomic) IBOutlet UITextField *option2TextField;
@property (strong, nonatomic) IBOutlet UIButton *setDateButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) NSString *entityName;

@property (copy, nonatomic) void (^addBranchCompletionBlock)(void);

@property (strong, nonatomic)          NSString *fnameText;

- (IBAction)setDateButtonTouched:(id)sender;
- (IBAction)saveButtonTouched:(id)sender;

@end
