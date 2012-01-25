// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to StalkerRelationship.h instead.

#import <CoreData/CoreData.h>


extern const struct StalkerRelationshipAttributes {
	__unsafe_unretained NSString *rank;
} StalkerRelationshipAttributes;

extern const struct StalkerRelationshipRelationships {
	__unsafe_unretained NSString *fromFriend;
	__unsafe_unretained NSString *toFriend;
} StalkerRelationshipRelationships;

extern const struct StalkerRelationshipFetchedProperties {
} StalkerRelationshipFetchedProperties;

@class Friend;
@class Friend;



@interface StalkerRelationshipID : NSManagedObjectID {}
@end

@interface _StalkerRelationship : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StalkerRelationshipID*)objectID;




@property (nonatomic, strong) NSNumber *rank;


@property short rankValue;
- (short)rankValue;
- (void)setRankValue:(short)value_;

//- (BOOL)validateRank:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Friend* fromFriend;

//- (BOOL)validateFromFriend:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Friend* toFriend;

//- (BOOL)validateToFriend:(id*)value_ error:(NSError**)error_;




@end

@interface _StalkerRelationship (CoreDataGeneratedAccessors)

@end

@interface _StalkerRelationship (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveRank;
- (void)setPrimitiveRank:(NSNumber*)value;

- (short)primitiveRankValue;
- (void)setPrimitiveRankValue:(short)value_;





- (Friend*)primitiveFromFriend;
- (void)setPrimitiveFromFriend:(Friend*)value;



- (Friend*)primitiveToFriend;
- (void)setPrimitiveToFriend:(Friend*)value;


@end
