// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Year.h instead.

#import <CoreData/CoreData.h>


extern const struct YearAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} YearAttributes;

extern const struct YearRelationships {
	__unsafe_unretained NSString *educations;
} YearRelationships;

extern const struct YearFetchedProperties {
} YearFetchedProperties;

@class Education;




@interface YearID : NSManagedObjectID {}
@end

@interface _Year : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (YearID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* educations;

- (NSMutableSet*)educationsSet;




@end

@interface _Year (CoreDataGeneratedAccessors)

- (void)addEducations:(NSSet*)value_;
- (void)removeEducations:(NSSet*)value_;
- (void)addEducationsObject:(Education*)value_;
- (void)removeEducationsObject:(Education*)value_;

@end

@interface _Year (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveEducations;
- (void)setPrimitiveEducations:(NSMutableSet*)value;


@end
