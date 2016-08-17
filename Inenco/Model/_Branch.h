// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Branch.h instead.

#import <CoreData/CoreData.h>

extern const struct BranchAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *branchName;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *fax;
	__unsafe_unretained NSString *hours;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *objectId;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *syncStatus;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *updatedAt;
} BranchAttributes;

@interface BranchID : NSManagedObjectID {}
@end

@interface _Branch : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BranchID* objectID;

@property (nonatomic, strong) NSString* address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* branchName;

//- (BOOL)validateBranchName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* createdAt;

//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* email;

//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* fax;

//- (BOOL)validateFax:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* hours;

//- (BOOL)validateHours:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* latitude;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* longitude;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* objectId;

//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* phone;

//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* syncStatus;

@property (atomic) int16_t syncStatusValue;
- (int16_t)syncStatusValue;
- (void)setSyncStatusValue:(int16_t)value_;

//- (BOOL)validateSyncStatus:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updatedAt;

//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;

@end

@interface _Branch (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSString*)primitiveBranchName;
- (void)setPrimitiveBranchName:(NSString*)value;

- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;

- (NSString*)primitiveFax;
- (void)setPrimitiveFax:(NSString*)value;

- (NSString*)primitiveHours;
- (void)setPrimitiveHours:(NSString*)value;

- (NSString*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSString*)value;

- (NSString*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSString*)value;

- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;

- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;

- (NSNumber*)primitiveSyncStatus;
- (void)setPrimitiveSyncStatus:(NSNumber*)value;

- (int16_t)primitiveSyncStatusValue;
- (void)setPrimitiveSyncStatusValue:(int16_t)value_;

- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;

@end
