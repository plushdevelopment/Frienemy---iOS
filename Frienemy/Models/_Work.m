// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Work.m instead.

#import "_Work.h"

const struct WorkAttributes WorkAttributes = {
	.end_date = @"end_date",
	.start_date = @"start_date",
	.work_description = @"work_description",
};

const struct WorkRelationships WorkRelationships = {
	.employer = @"employer",
	.friend = @"friend",
	.location = @"location",
	.position = @"position",
};

const struct WorkFetchedProperties WorkFetchedProperties = {
};

@implementation WorkID
@end

@implementation _Work

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Work" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Work";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Work" inManagedObjectContext:moc_];
}

- (WorkID*)objectID {
	return (WorkID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic end_date;






@dynamic start_date;






@dynamic work_description;






@dynamic employer;

	

@dynamic friend;

	

@dynamic location;

	

@dynamic position;

	





@end
