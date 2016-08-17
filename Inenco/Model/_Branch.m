// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Branch.m instead.

#import "_Branch.h"

const struct BranchAttributes BranchAttributes = {
	.address = @"address",
	.branchName = @"branchName",
	.createdAt = @"createdAt",
	.date = @"date",
	.email = @"email",
	.fax = @"fax",
	.hours = @"hours",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.objectId = @"objectId",
	.phone = @"phone",
	.syncStatus = @"syncStatus",
	.type = @"type",
	.updatedAt = @"updatedAt",
};

@implementation BranchID
@end

@implementation _Branch

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Branch" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Branch";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Branch" inManagedObjectContext:moc_];
}

- (BranchID*)objectID {
	return (BranchID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"syncStatusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncStatus"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic address;

@dynamic branchName;

@dynamic createdAt;

@dynamic date;

@dynamic email;

@dynamic fax;

@dynamic hours;

@dynamic latitude;

@dynamic longitude;

@dynamic objectId;

@dynamic phone;

@dynamic syncStatus;

- (int16_t)syncStatusValue {
	NSNumber *result = [self syncStatus];
	return [result shortValue];
}

- (void)setSyncStatusValue:(int16_t)value_ {
	[self setSyncStatus:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveSyncStatusValue {
	NSNumber *result = [self primitiveSyncStatus];
	return [result shortValue];
}

- (void)setPrimitiveSyncStatusValue:(int16_t)value_ {
	[self setPrimitiveSyncStatus:[NSNumber numberWithShort:value_]];
}

@dynamic type;

@dynamic updatedAt;

@end

