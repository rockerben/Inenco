#import "BranchO.h"

@interface BranchO:NSObject  {
 NSString *_branchName;
    NSString *_type;
    NSString *_email;
    NSString *_phone;
    NSString *_fax;
    NSString *_address;


}


@property (nonatomic) NSString *branchName;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *phone;
@property (nonatomic) NSString *fax;
@property (nonatomic) NSString *address;


- (id)initWithBranchOName:(NSString *)branchName
              type:(NSString *)type
             email:(NSString *)email
             phone:(NSString *)phone
               fax:(NSString *)fax
           address:(NSString *)address;


@end



