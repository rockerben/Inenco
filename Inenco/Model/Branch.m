#import "Branch.h"
#import "NSManagedObject+JSON.h"
#import "SDSyncEngine.h"

@interface Branch ()

// Private interface goes here.

@end

@implementation Branch

@dynamic branchName;
@dynamic type;
@dynamic email;
@dynamic phone;
@dynamic fax;
@dynamic address;
@dynamic createdAt;
@dynamic updatedAt;
@dynamic syncStatus;
@dynamic date;
@dynamic objectId;
@dynamic longitude;
@dynamic latitude;




- (NSDictionary *)JSONToCreateObjectOnServer {
    NSDictionary *date = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Date", @"__type",
                          [[SDSyncEngine sharedEngine] dateStringForAPIUsingDate:self.date], @"iso" , nil];
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.branchName, @"branchName",
                                    self.email, @"email",
                                    self.address, @"address",
                                    self.longitude, @"longitude",
                                    self.latitude, @"latitude",
                                    self.type, @"type",
                                    self.phone, @"phone",
                                    //self.fax, "fax",
                                    date, @"date",
                                    nil];
    return jsonDictionary;
}



- (id)initWithBranchName:(NSString *)branchName
                    type:(NSString *)type
                   email:(NSString *)email
                   phone:(NSString *)phone
                     fax:(NSString *)fax
                 address:(NSString *)address
               longitude:(NSString *)longitude
                latitude:(NSString *)latitude
               updatedAt:(NSDate *)updatedAt
{
    
    if ((self = [super init])) {
        self.branchName = branchName;
        self.type = type;
        self.phone = phone;
        self.fax = fax;
        self.address = address;
        self.longitude = longitude;
        self.latitude = latitude;
        self.date = updatedAt;
        
    }
    return self;
    
}



@end



