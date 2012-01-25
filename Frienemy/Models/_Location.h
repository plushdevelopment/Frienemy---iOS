// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Location.h instead.

#import <CoreData/CoreData.h>


extern const struct LocationAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} LocationAttributes;

extern const struct LocationRelationships {
	__unsafe_unretained NSString *hometownOfFriends;
	__unsafe_unretained NSString *locationOfFriends;
	__unsafe_unretained NSString *works;
} LocationRelationships;

extern const struct LocationFetchedProperties {
} LocationFetchedProperties;

@class Friend;
@class Friend;
@class Work;




@interface LocationID : NSManagedObjectID {}
@end

@interface _Location : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LocationID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* hometownOfFriends;

- (NSMutableSet*)hometownOfFriendsSet;




@property (nonatomic, strong) NSSet* locationOfFriends;

- (NSMutableSet*)locationOfFriendsSet;




@property (nonatomic, strong) NSSet* works;

- (NSMutableSet*)worksSet;




@end

@interface _Location (CoreDataGeneratedAccessors)

- (void)addHometownOfFriends:(NSSet*)value_;
- (void)removeHometownOfFriends:(NSSet*)value_;
- (void)addHometownOfFriendsObject:(Friend*)value_;
- (void)removeHometownOfFriendsObject:(Friend*)value_;

- (void)addLocationOfFriends:(NSSet*)value_;
- (void)removeLocationOfFriends:(NSSet*)value_;
- (void)addLocationOfFriendsObject:(Friend*)value_;
- (void)removeLocationOfFriendsObject:(Friend*)value_;

- (void)addWorks:(NSSet*)value_;
- (void)removeWorks:(NSSet*)value_;
- (void)addWorksObject:(Work*)value_;
- (void)removeWorksObject:(Work*)value_;

@end

@interface _Location (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveHometownOfFriends;
- (void)setPrimitiveHometownOfFriends:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLocationOfFriends;
- (void)setPrimitiveLocationOfFriends:(NSMutableSet*)value;



- (NSMutableSet*)primitiveWorks;
- (void)setPrimitiveWorks:(NSMutableSet*)value;


@end
