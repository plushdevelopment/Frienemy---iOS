// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Employer.m instead.

#import "_Employer.h"

const struct EmployerAttributes EmployerAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct EmployerRelationships EmployerRelationships = {
	.works = @"works",
};

const struct EmployerFetchedProperties EmployerFetchedProperties = {
};

@implementation EmployerID
@end

@implementation _Employer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Employer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Employer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Employer" inManagedObjectContext:moc_];
}

- (EmployerID*)objectID {
	return (EmployerID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic uid;






@dynamic works;

	
- (NSMutableSet*)worksSet {
	[self willAccessValueForKey:@"works"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"works"];
  
	[self didAccessValueForKey:@"works"];
	return result;
}
	





@end
