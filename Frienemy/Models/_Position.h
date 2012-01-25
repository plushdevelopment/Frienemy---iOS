// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Position.h instead.

#import <CoreData/CoreData.h>


extern const struct PositionAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} PositionAttributes;

extern const struct PositionRelationships {
	__unsafe_unretained NSString *works;
} PositionRelationships;

extern const struct PositionFetchedProperties {
} PositionFetchedProperties;

@class Work;




@interface PositionID : NSManagedObjectID {}
@end

@interface _Position : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PositionID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* works;

- (NSMutableSet*)worksSet;




@end

@interface _Position (CoreDataGeneratedAccessors)

- (void)addWorks:(NSSet*)value_;
- (void)removeWorks:(NSSet*)value_;
- (void)addWorksObject:(Work*)value_;
- (void)removeWorksObject:(Work*)value_;

@end

@interface _Position (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveWorks;
- (void)setPrimitiveWorks:(NSMutableSet*)value;


@end
