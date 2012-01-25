// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Language.h instead.

#import <CoreData/CoreData.h>


extern const struct LanguageAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} LanguageAttributes;

extern const struct LanguageRelationships {
	__unsafe_unretained NSString *friends;
} LanguageRelationships;

extern const struct LanguageFetchedProperties {
} LanguageFetchedProperties;

@class Friend;




@interface LanguageID : NSManagedObjectID {}
@end

@interface _Language : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LanguageID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* friends;

- (NSMutableSet*)friendsSet;




@end

@interface _Language (CoreDataGeneratedAccessors)

- (void)addFriends:(NSSet*)value_;
- (void)removeFriends:(NSSet*)value_;
- (void)addFriendsObject:(Friend*)value_;
- (void)removeFriendsObject:(Friend*)value_;

@end

@interface _Language (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveFriends;
- (void)setPrimitiveFriends:(NSMutableSet*)value;


@end
