// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to StalkerRelationship.m instead.

#import "_StalkerRelationship.h"

const struct StalkerRelationshipAttributes StalkerRelationshipAttributes = {
	.rank = @"rank",
};

const struct StalkerRelationshipRelationships StalkerRelationshipRelationships = {
	.fromFriend = @"fromFriend",
	.toFriend = @"toFriend",
};

const struct StalkerRelationshipFetchedProperties StalkerRelationshipFetchedProperties = {
};

@implementation StalkerRelationshipID
@end

@implementation _StalkerRelationship

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"StalkerRelationship" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"StalkerRelationship";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"StalkerRelationship" inManagedObjectContext:moc_];
}

- (StalkerRelationshipID*)objectID {
	return (StalkerRelationshipID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"rankValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rank"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic rank;



- (short)rankValue {
	NSNumber *result = [self rank];
	return [result shortValue];
}

- (void)setRankValue:(short)value_ {
	[self setRank:[NSNumber numberWithShort:value_]];
}

- (short)primitiveRankValue {
	NSNumber *result = [self primitiveRank];
	return [result shortValue];
}

- (void)setPrimitiveRankValue:(short)value_ {
	[self setPrimitiveRank:[NSNumber numberWithShort:value_]];
}





@dynamic fromFriend;

	

@dynamic toFriend;

	





@end
