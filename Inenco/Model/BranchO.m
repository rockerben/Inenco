#import "BranchO.h"



@implementation BranchO
@synthesize branchName = _branchName;
@synthesize type = _type;
@synthesize email = _email;
@synthesize phone = _phone;
@synthesize fax = _fax;
@synthesize address = _address;



- (id)initWithBranchOName:(NSString *)branchName
type:(NSString *)type
email:(NSString *)email
phone:(NSString *)phone
fax:(NSString *)fax
address:(NSString *)address
{
    
    if ((self = [super init])) {
        self.branchName = branchName;
        self.type = type;
        self.phone = phone;
        self.fax = fax;
        self.address = address;
        
    }
    return self;
    
}



@end



