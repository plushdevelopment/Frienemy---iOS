// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Work.h instead.

#import <CoreData/CoreData.h>


extern const struct WorkAttributes {
	__unsafe_unretained NSString *end_date;
	__unsafe_unretained NSString *start_date;
	__unsafe_unretained NSString *work_description;
} WorkAttributes;

extern const struct WorkRelationships {
	__unsafe_unretained NSString *employer;
	__unsafe_unretained NSString *friend;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *position;
} WorkRelationships;

extern const struct WorkFetchedProperties {
} WorkFetchedProperties;

@class Employer;
@class Friend;
@class Location;
@class Position;





@interface WorkID : NSManagedObjectID {}
@end

@interface _Work : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WorkID*)objectID;




@property (nonatomic, strong) NSString *end_date;


//- (BOOL)validateEnd_date:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *start_date;


//- (BOOL)validateStart_date:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *work_description;


//- (BOOL)validateWork_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Employer* employer;

//- (BOOL)validateEmployer:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Friend* friend;

//- (BOOL)validateFriend:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Location* location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Position* position;

//- (BOOL)validatePosition:(id*)value_ error:(NSError**)error_;




@end

@interface _Work (CoreDataGeneratedAccessors)

@end

@interface _Work (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEnd_date;
- (void)setPrimitiveEnd_date:(NSString*)value;




- (NSString*)primitiveStart_date;
- (void)setPrimitiveStart_date:(NSString*)value;




- (NSString*)primitiveWork_description;
- (void)setPrimitiveWork_description:(NSString*)value;





- (Employer*)primitiveEmployer;
- (void)setPrimitiveEmployer:(Employer*)value;



- (Friend*)primitiveFriend;
- (void)setPrimitiveFriend:(Friend*)value;



- (Location*)primitiveLocation;
- (void)setPrimitiveLocation:(Location*)value;



- (Position*)primitivePosition;
- (void)setPrimitivePosition:(Position*)value;


@end
