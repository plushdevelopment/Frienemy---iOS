// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Friend.h instead.

#import <CoreData/CoreData.h>


extern const struct FriendAttributes {
	__unsafe_unretained NSString *bio;
	__unsafe_unretained NSString *birthday;
	__unsafe_unretained NSString *gender;
	__unsafe_unretained NSString *isCurrentUser;
	__unsafe_unretained NSString *isCurrentUsersFriend;
	__unsafe_unretained NSString *isFrienemy;
	__unsafe_unretained NSString *link;
	__unsafe_unretained NSString *locale;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *quotes;
	__unsafe_unretained NSString *relationship_status;
	__unsafe_unretained NSString *section;
	__unsafe_unretained NSString *stalking;
	__unsafe_unretained NSString *uid;
	__unsafe_unretained NSString *updated_time;
	__unsafe_unretained NSString *username;
	__unsafe_unretained NSString *website;
} FriendAttributes;

extern const struct FriendRelationships {
	__unsafe_unretained NSString *hometown;
	__unsafe_unretained NSString *languages;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *significant_other;
	__unsafe_unretained NSString *stalkers;
	__unsafe_unretained NSString *stalkingRelationships;
	__unsafe_unretained NSString *user;
	__unsafe_unretained NSString *work;
} FriendRelationships;

extern const struct FriendFetchedProperties {
} FriendFetchedProperties;

@class Location;
@class Language;
@class Location;
@class Friend;
@class StalkerRelationship;
@class StalkerRelationship;
@class User;
@class Work;



















@interface FriendID : NSManagedObjectID {}
@end

@interface _Friend : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (FriendID*)objectID;




@property (nonatomic, strong) NSString *bio;


//- (BOOL)validateBio:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *birthday;


//- (BOOL)validateBirthday:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *gender;


//- (BOOL)validateGender:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *isCurrentUser;


@property BOOL isCurrentUserValue;
- (BOOL)isCurrentUserValue;
- (void)setIsCurrentUserValue:(BOOL)value_;

//- (BOOL)validateIsCurrentUser:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *isCurrentUsersFriend;


@property BOOL isCurrentUsersFriendValue;
- (BOOL)isCurrentUsersFriendValue;
- (void)setIsCurrentUsersFriendValue:(BOOL)value_;

//- (BOOL)validateIsCurrentUsersFriend:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *isFrienemy;


@property BOOL isFrienemyValue;
- (BOOL)isFrienemyValue;
- (void)setIsFrienemyValue:(BOOL)value_;

//- (BOOL)validateIsFrienemy:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *link;


//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *locale;


//- (BOOL)validateLocale:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *quotes;


//- (BOOL)validateQuotes:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *relationship_status;


//- (BOOL)validateRelationship_status:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *section;


//- (BOOL)validateSection:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *stalking;


@property BOOL stalkingValue;
- (BOOL)stalkingValue;
- (void)setStalkingValue:(BOOL)value_;

//- (BOOL)validateStalking:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *updated_time;


//- (BOOL)validateUpdated_time:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *username;


//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *website;


//- (BOOL)validateWebsite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Location* hometown;

//- (BOOL)validateHometown:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* languages;

- (NSMutableSet*)languagesSet;




@property (nonatomic, strong) Location* location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Friend* significant_other;

//- (BOOL)validateSignificant_other:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* stalkers;

- (NSMutableSet*)stalkersSet;




@property (nonatomic, strong) NSSet* stalkingRelationships;

- (NSMutableSet*)stalkingRelationshipsSet;




@property (nonatomic, strong) User* user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* work;

- (NSMutableSet*)workSet;




@end

@interface _Friend (CoreDataGeneratedAccessors)

- (void)addLanguages:(NSSet*)value_;
- (void)removeLanguages:(NSSet*)value_;
- (void)addLanguagesObject:(Language*)value_;
- (void)removeLanguagesObject:(Language*)value_;

- (void)addStalkers:(NSSet*)value_;
- (void)removeStalkers:(NSSet*)value_;
- (void)addStalkersObject:(StalkerRelationship*)value_;
- (void)removeStalkersObject:(StalkerRelationship*)value_;

- (void)addStalkingRelationships:(NSSet*)value_;
- (void)removeStalkingRelationships:(NSSet*)value_;
- (void)addStalkingRelationshipsObject:(StalkerRelationship*)value_;
- (void)removeStalkingRelationshipsObject:(StalkerRelationship*)value_;

- (void)addWork:(NSSet*)value_;
- (void)removeWork:(NSSet*)value_;
- (void)addWorkObject:(Work*)value_;
- (void)removeWorkObject:(Work*)value_;

@end

@interface _Friend (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBio;
- (void)setPrimitiveBio:(NSString*)value;




- (NSString*)primitiveBirthday;
- (void)setPrimitiveBirthday:(NSString*)value;




- (NSString*)primitiveGender;
- (void)setPrimitiveGender:(NSString*)value;




- (NSNumber*)primitiveIsCurrentUser;
- (void)setPrimitiveIsCurrentUser:(NSNumber*)value;

- (BOOL)primitiveIsCurrentUserValue;
- (void)setPrimitiveIsCurrentUserValue:(BOOL)value_;




- (NSNumber*)primitiveIsCurrentUsersFriend;
- (void)setPrimitiveIsCurrentUsersFriend:(NSNumber*)value;

- (BOOL)primitiveIsCurrentUsersFriendValue;
- (void)setPrimitiveIsCurrentUsersFriendValue:(BOOL)value_;




- (NSNumber*)primitiveIsFrienemy;
- (void)setPrimitiveIsFrienemy:(NSNumber*)value;

- (BOOL)primitiveIsFrienemyValue;
- (void)setPrimitiveIsFrienemyValue:(BOOL)value_;




- (NSString*)primitiveLink;
- (void)setPrimitiveLink:(NSString*)value;




- (NSString*)primitiveLocale;
- (void)setPrimitiveLocale:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveQuotes;
- (void)setPrimitiveQuotes:(NSString*)value;




- (NSString*)primitiveRelationship_status;
- (void)setPrimitiveRelationship_status:(NSString*)value;




- (NSString*)primitiveSection;
- (void)setPrimitiveSection:(NSString*)value;




- (NSNumber*)primitiveStalking;
- (void)setPrimitiveStalking:(NSNumber*)value;

- (BOOL)primitiveStalkingValue;
- (void)setPrimitiveStalkingValue:(BOOL)value_;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;




- (NSString*)primitiveUpdated_time;
- (void)setPrimitiveUpdated_time:(NSString*)value;




- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;




- (NSString*)primitiveWebsite;
- (void)setPrimitiveWebsite:(NSString*)value;





- (Location*)primitiveHometown;
- (void)setPrimitiveHometown:(Location*)value;



- (NSMutableSet*)primitiveLanguages;
- (void)setPrimitiveLanguages:(NSMutableSet*)value;



- (Location*)primitiveLocation;
- (void)setPrimitiveLocation:(Location*)value;



- (Friend*)primitiveSignificant_other;
- (void)setPrimitiveSignificant_other:(Friend*)value;



- (NSMutableSet*)primitiveStalkers;
- (void)setPrimitiveStalkers:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStalkingRelationships;
- (void)setPrimitiveStalkingRelationships:(NSMutableSet*)value;



- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;



- (NSMutableSet*)primitiveWork;
- (void)setPrimitiveWork:(NSMutableSet*)value;


@end
