// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Position.m instead.

#import "_Position.h"

const struct PositionAttributes PositionAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct PositionRelationships PositionRelationships = {
	.works = @"works",
};

const struct PositionFetchedProperties PositionFetchedProperties = {
};

@implementation PositionID
@end

@implementation _Position

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Position" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Position";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Position" inManagedObjectContext:moc_];
}

- (PositionID*)objectID {
	return (PositionID*)[super objectID];
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
