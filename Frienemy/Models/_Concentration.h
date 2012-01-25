// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Concentration.h instead.

#import <CoreData/CoreData.h>


extern const struct ConcentrationAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} ConcentrationAttributes;

extern const struct ConcentrationRelationships {
	__unsafe_unretained NSString *educations;
} ConcentrationRelationships;

extern const struct ConcentrationFetchedProperties {
} ConcentrationFetchedProperties;

@class Education;




@interface ConcentrationID : NSManagedObjectID {}
@end

@interface _Concentration : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ConcentrationID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* educations;

- (NSMutableSet*)educationsSet;




@end

@interface _Concentration (CoreDataGeneratedAccessors)

- (void)addEducations:(NSSet*)value_;
- (void)removeEducations:(NSSet*)value_;
- (void)addEducationsObject:(Education*)value_;
- (void)removeEducationsObject:(Education*)value_;

@end

@interface _Concentration (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveEducations;
- (void)setPrimitiveEducations:(NSMutableSet*)value;


@end
