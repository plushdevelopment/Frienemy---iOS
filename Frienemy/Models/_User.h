// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>


extern const struct UserAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *friends;
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;

@class Friend;




@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* friends;

- (NSMutableSet*)friendsSet;




@end

@interface _User (CoreDataGeneratedAccessors)

- (void)addFriends:(NSSet*)value_;
- (void)removeFriends:(NSSet*)value_;
- (void)addFriendsObject:(Friend*)value_;
- (void)removeFriendsObject:(Friend*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveFriends;
- (void)setPrimitiveFriends:(NSMutableSet*)value;


@end
