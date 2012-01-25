// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to School.h instead.

#import <CoreData/CoreData.h>


extern const struct SchoolAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} SchoolAttributes;

extern const struct SchoolRelationships {
	__unsafe_unretained NSString *educations;
} SchoolRelationships;

extern const struct SchoolFetchedProperties {
} SchoolFetchedProperties;

@class Education;




@interface SchoolID : NSManagedObjectID {}
@end

@interface _School : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SchoolID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* educations;

- (NSMutableSet*)educationsSet;




@end

@interface _School (CoreDataGeneratedAccessors)

- (void)addEducations:(NSSet*)value_;
- (void)removeEducations:(NSSet*)value_;
- (void)addEducationsObject:(Education*)value_;
- (void)removeEducationsObject:(Education*)value_;

@end

@interface _School (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveEducations;
- (void)setPrimitiveEducations:(NSMutableSet*)value;


@end
