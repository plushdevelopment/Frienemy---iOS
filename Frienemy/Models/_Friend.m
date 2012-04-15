// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Friend.m instead.

#import "_Friend.h"

const struct FriendAttributes FriendAttributes = {
	.bio = @"bio",
	.birthday = @"birthday",
	.email = @"email",
	.gender = @"gender",
	.isCurrentUser = @"isCurrentUser",
	.isCurrentUsersFriend = @"isCurrentUsersFriend",
	.isFrienemy = @"isFrienemy",
	.link = @"link",
	.locale = @"locale",
	.name = @"name",
	.political = @"political",
	.quotes = @"quotes",
	.relationship_status = @"relationship_status",
	.religion = @"religion",
	.section = @"section",
	.stalking = @"stalking",
	.uid = @"uid",
	.updated_time = @"updated_time",
	.username = @"username",
	.website = @"website",
};

const struct FriendRelationships FriendRelationships = {
	.education = @"education",
	.hometown = @"hometown",
	.languages = @"languages",
	.location = @"location",
	.significant_other = @"significant_other",
	.stalkers = @"stalkers",
	.stalkingRelationships = @"stalkingRelationships",
	.user = @"user",
	.work = @"work",
};

const struct FriendFetchedProperties FriendFetchedProperties = {
};

@implementation FriendID
@end

@implementation _Friend

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Friend";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Friend" inManagedObjectContext:moc_];
}

- (FriendID*)objectID {
	return (FriendID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isCurrentUserValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isCurrentUser"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"isCurrentUsersFriendValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isCurrentUsersFriend"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"isFrienemyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFrienemy"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"stalkingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"stalking"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic bio;






@dynamic birthday;






@dynamic email;






@dynamic gender;






@dynamic isCurrentUser;



- (BOOL)isCurrentUserValue {
	NSNumber *result = [self isCurrentUser];
	return [result boolValue];
}

- (void)setIsCurrentUserValue:(BOOL)value_ {
	[self setIsCurrentUser:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsCurrentUserValue {
	NSNumber *result = [self primitiveIsCurrentUser];
	return [result boolValue];
}

- (void)setPrimitiveIsCurrentUserValue:(BOOL)value_ {
	[self setPrimitiveIsCurrentUser:[NSNumber numberWithBool:value_]];
}





@dynamic isCurrentUsersFriend;



- (BOOL)isCurrentUsersFriendValue {
	NSNumber *result = [self isCurrentUsersFriend];
	return [result boolValue];
}

- (void)setIsCurrentUsersFriendValue:(BOOL)value_ {
	[self setIsCurrentUsersFriend:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsCurrentUsersFriendValue {
	NSNumber *result = [self primitiveIsCurrentUsersFriend];
	return [result boolValue];
}

- (void)setPrimitiveIsCurrentUsersFriendValue:(BOOL)value_ {
	[self setPrimitiveIsCurrentUsersFriend:[NSNumber numberWithBool:value_]];
}





@dynamic isFrienemy;



- (BOOL)isFrienemyValue {
	NSNumber *result = [self isFrienemy];
	return [result boolValue];
}

- (void)setIsFrienemyValue:(BOOL)value_ {
	[self setIsFrienemy:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsFrienemyValue {
	NSNumber *result = [self primitiveIsFrienemy];
	return [result boolValue];
}

- (void)setPrimitiveIsFrienemyValue:(BOOL)value_ {
	[self setPrimitiveIsFrienemy:[NSNumber numberWithBool:value_]];
}





@dynamic link;






@dynamic locale;






@dynamic name;






@dynamic political;






@dynamic quotes;






@dynamic relationship_status;






@dynamic religion;






@dynamic section;






@dynamic stalking;



- (BOOL)stalkingValue {
	NSNumber *result = [self stalking];
	return [result boolValue];
}

- (void)setStalkingValue:(BOOL)value_ {
	[self setStalking:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveStalkingValue {
	NSNumber *result = [self primitiveStalking];
	return [result boolValue];
}

- (void)setPrimitiveStalkingValue:(BOOL)value_ {
	[self setPrimitiveStalking:[NSNumber numberWithBool:value_]];
}





@dynamic uid;






@dynamic updated_time;






@dynamic username;






@dynamic website;






@dynamic education;

	
- (NSMutableSet*)educationSet {
	[self willAccessValueForKey:@"education"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"education"];
  
	[self didAccessValueForKey:@"education"];
	return result;
}
	

@dynamic hometown;

	

@dynamic languages;

	
- (NSMutableSet*)languagesSet {
	[self willAccessValueForKey:@"languages"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"languages"];
  
	[self didAccessValueForKey:@"languages"];
	return result;
}
	

@dynamic location;

	

@dynamic significant_other;

	

@dynamic stalkers;

	
- (NSMutableSet*)stalkersSet {
	[self willAccessValueForKey:@"stalkers"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stalkers"];
  
	[self didAccessValueForKey:@"stalkers"];
	return result;
}
	

@dynamic stalkingRelationships;

	
- (NSMutableSet*)stalkingRelationshipsSet {
	[self willAccessValueForKey:@"stalkingRelationships"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stalkingRelationships"];
  
	[self didAccessValueForKey:@"stalkingRelationships"];
	return result;
}
	

@dynamic user;

	

@dynamic work;

	
- (NSMutableSet*)workSet {
	[self willAccessValueForKey:@"work"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"work"];
  
	[self didAccessValueForKey:@"work"];
	return result;
}
	





@end
