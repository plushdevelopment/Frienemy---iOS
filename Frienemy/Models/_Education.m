// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Education.m instead.

#import "_Education.h"

const struct EducationAttributes EducationAttributes = {
	.type = @"type",
};

const struct EducationRelationships EducationRelationships = {
	.concentration = @"concentration",
	.friend = @"friend",
	.school = @"school",
	.year = @"year",
};

const struct EducationFetchedProperties EducationFetchedProperties = {
};

@implementation EducationID
@end

@implementation _Education

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Education" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Education";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Education" inManagedObjectContext:moc_];
}

- (EducationID*)objectID {
	return (EducationID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic type;






@dynamic concentration;

	
- (NSMutableSet*)concentrationSet {
	[self willAccessValueForKey:@"concentration"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"concentration"];
  
	[self didAccessValueForKey:@"concentration"];
	return result;
}
	

@dynamic friend;

	

@dynamic school;

	

@dynamic year;

	





@end
