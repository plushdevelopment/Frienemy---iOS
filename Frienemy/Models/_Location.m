// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Location.m instead.

#import "_Location.h"

const struct LocationAttributes LocationAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct LocationRelationships LocationRelationships = {
	.hometownOfFriends = @"hometownOfFriends",
	.locationOfFriends = @"locationOfFriends",
	.works = @"works",
};

const struct LocationFetchedProperties LocationFetchedProperties = {
};

@implementation LocationID
@end

@implementation _Location

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (LocationID*)objectID {
	return (LocationID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic uid;






@dynamic hometownOfFriends;

	
- (NSMutableSet*)hometownOfFriendsSet {
	[self willAccessValueForKey:@"hometownOfFriends"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hometownOfFriends"];
  
	[self didAccessValueForKey:@"hometownOfFriends"];
	return result;
}
	

@dynamic locationOfFriends;

	
- (NSMutableSet*)locationOfFriendsSet {
	[self willAccessValueForKey:@"locationOfFriends"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"locationOfFriends"];
  
	[self didAccessValueForKey:@"locationOfFriends"];
	return result;
}
	

@dynamic works;

	
- (NSMutableSet*)worksSet {
	[self willAccessValueForKey:@"works"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"works"];
  
	[self didAccessValueForKey:@"works"];
	return result;
}
	





@end
