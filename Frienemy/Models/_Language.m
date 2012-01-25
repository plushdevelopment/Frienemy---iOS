// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Language.m instead.

#import "_Language.h"

const struct LanguageAttributes LanguageAttributes = {
	.name = @"name",
	.uid = @"uid",
};

const struct LanguageRelationships LanguageRelationships = {
	.friends = @"friends",
};

const struct LanguageFetchedProperties LanguageFetchedProperties = {
};

@implementation LanguageID
@end

@implementation _Language

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Language" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Language";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Language" inManagedObjectContext:moc_];
}

- (LanguageID*)objectID {
	return (LanguageID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic uid;






@dynamic friends;

	
- (NSMutableSet*)friendsSet {
	[self willAccessValueForKey:@"friends"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"friends"];
  
	[self didAccessValueForKey:@"friends"];
	return result;
}
	





@end
