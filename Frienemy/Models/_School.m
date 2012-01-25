// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to School.m instead.

#import "_School.h"

const struct SchoolAttributes SchoolAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct SchoolRelationships SchoolRelationships = {
	.educations = @"educations",
};

const struct SchoolFetchedProperties SchoolFetchedProperties = {
};

@implementation SchoolID
@end

@implementation _School

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"School";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"School" inManagedObjectContext:moc_];
}

- (SchoolID*)objectID {
	return (SchoolID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic uid;






@dynamic educations;

	
- (NSMutableSet*)educationsSet {
	[self willAccessValueForKey:@"educations"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"educations"];
  
	[self didAccessValueForKey:@"educations"];
	return result;
}
	





@end
