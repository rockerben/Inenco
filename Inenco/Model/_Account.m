// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.m instead.

#import "_Account.h"

const struct AccountAttributes AccountAttributes = {
	.accountName = @"accountName",
	.address = @"address",
	.createdAt = @"createdAt",
	.date = @"date",
	.image = @"image",
	.objectId = @"objectId",
	.phone = @"phone",
	.salesrep = @"salesrep",
	.syncStatus = @"syncStatus",
	.updatedAt = @"updatedAt",
	.website = @"website",
};

@implementation AccountID
@end

@implementation _Account

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Account";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Account" inManagedObjectContext:moc_];
}

- (AccountID*)objectID {
	return (AccountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"phoneValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"phone"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"syncStatusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncStatus"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic accountName;

@dynamic address;

@dynamic createdAt;

@dynamic date;

@dynamic image;

@dynamic objectId;

@dynamic phone;

- (int16_t)phoneValue {
	NSNumber *result = [self phone];
	return [result shortValue];
}

- (void)setPhoneValue:(int16_t)value_ {
	[self setPhone:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePhoneValue {
	NSNumber *result = [self primitivePhone];
	return [result shortValue];
}

- (void)setPrimitivePhoneValue:(int16_t)value_ {
	[self setPrimitivePhone:[NSNumber numberWithShort:value_]];
}

@dynamic salesrep;

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

@dynamic updatedAt;

@dynamic website;

@end

