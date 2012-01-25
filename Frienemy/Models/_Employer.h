// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Employer.h instead.

#import <CoreData/CoreData.h>


extern const struct EmployerAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} EmployerAttributes;

extern const struct EmployerRelationships {
	__unsafe_unretained NSString *works;
} EmployerRelationships;

extern const struct EmployerFetchedProperties {
} EmployerFetchedProperties;

@class Work;




@interface EmployerID : NSManagedObjectID {}
@end

@interface _Employer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EmployerID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *uid;


//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* works;

- (NSMutableSet*)worksSet;




@end

@interface _Employer (CoreDataGeneratedAccessors)

- (void)addWorks:(NSSet*)value_;
- (void)removeWorks:(NSSet*)value_;
- (void)addWorksObject:(Work*)value_;
- (void)removeWorksObject:(Work*)value_;

@end

@interface _Employer (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;





- (NSMutableSet*)primitiveWorks;
- (void)setPrimitiveWorks:(NSMutableSet*)value;


@end
