// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Concentration.m instead.

#import "_Concentration.h"

const struct ConcentrationAttributes ConcentrationAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct ConcentrationRelationships ConcentrationRelationships = {
	.educations = @"educations",
};

const struct ConcentrationFetchedProperties ConcentrationFetchedProperties = {
};

@implementation ConcentrationID
@end

@implementation _Concentration

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Concentration" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Concentration";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Concentration" inManagedObjectContext:moc_];
}

- (ConcentrationID*)objectID {
	return (ConcentrationID*)[super objectID];
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
