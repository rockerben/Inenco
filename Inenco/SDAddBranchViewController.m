//
//  SDAddBranchViewController.m
//

#import "SDAddBranchViewController.h"
#import "SDCoreDataController.h"

@interface SDAddBranchViewController ()

@property CGPoint originalCenter;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObject *branchRecord;

@end

@implementation SDAddBranchViewController

@synthesize nameTextField;
@synthesize option1TextField;
@synthesize option2TextField;
@synthesize setDateButton;
@synthesize datePicker;
@synthesize entityName;

@synthesize addBranchCompletionBlock;

@synthesize originalCenter;
@synthesize managedObjectContext;
@synthesize branchRecord;


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
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.branchRecord = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:self.managedObjectContext];
    self.datePicker.date = [NSDate date];
    self.nameTextField.text = self.fnameText;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.originalCenter = self.view.center;
}

- (void)viewDidUnload {
    [self setNameTextField:nil];
    [self setOption1TextField:nil];
    [self setOption2TextField:nil];
    [self setSetDateButton:nil];
    [self setDatePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)setDateButtonTouched:(id)sender {
    [self.nameTextField resignFirstResponder];
    [self.option1TextField resignFirstResponder];
    [self.option2TextField resignFirstResponder];
    
    if (self.datePicker.isHidden) {
        [self.datePicker setHidden:NO];
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setCenter:CGPointMake(self.originalCenter.x, self.originalCenter.y-30)]; 
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setCenter:self.originalCenter];
        } completion:^(BOOL finished) {
            [self.datePicker setHidden:YES];
        }];
    }
}

- (IBAction)saveButtonTouched:(id)sender {
    if (![self.nameTextField.text isEqualToString:@""] && self.datePicker.date) {
        [self.branchRecord setValue:self.nameTextField.text forKey:@"branchName"];
        [self.branchRecord setValue:[self dateSetToMidnightUsingDate:self.datePicker.date] forKey:@"date"];
        // Set syncStatus flag to SDObjectCreated
        [self.branchRecord setValue:[NSNumber numberWithInt:SDObjectCreated] forKey:@"syncStatus"];
        
        if ([self.entityName isEqualToString:@"OrderHeader"]) {
            [self.branchRecord setValue:self.option1TextField.text forKey:@"orderDesc"];
            //[self.branchRecord setValue:self.option2TextField.text forKey:@""];
        } else if ([self.entityName isEqualToString:@"Birthday"]) {
            [self.branchRecord setValue:self.option1TextField.text forKey:@"giftIdeas"];
            [self.branchRecord setValue:self.option2TextField.text forKey:@"facebook"];
        }
        [self.managedObjectContext performBlockAndWait:^{
            NSError *error = nil;
            BOOL saved = [self.managedObjectContext save:&error]; 
            if (!saved) {
                // do some real error handling
                NSLog(@"Could not save record due to %@", error);
            }
            [[SDCoreDataController sharedInstance] saveMasterContext];
        }];
        
        [self.navigationController popViewControllerAnimated:YES];
        addBranchCompletionBlock();
        
    } else {
        UIAlertView *cannotSaveAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"You must at least set a name and date" delegate:nil cancelButtonTitle:@"Duh" otherButtonTitles:nil];
        [cannotSaveAlert show];
    }
}

- (NSDate *)dateSetToMidnightUsingDate:(NSDate *)aDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSUIntegerMax fromDate:aDate];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [gregorian dateFromComponents: components];
}

@end
