// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Year.m instead.

#import "_Year.h"

const struct YearAttributes YearAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct YearRelationships YearRelationships = {
	.educations = @"educations",
};

const struct YearFetchedProperties YearFetchedProperties = {
};

@implementation YearID
@end

@implementation _Year

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Year" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Year";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Year" inManagedObjectContext:moc_];
}

- (YearID*)objectID {
	return (YearID*)[super objectID];
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
