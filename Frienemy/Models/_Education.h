// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Education.h instead.

#import <CoreData/CoreData.h>


extern const struct EducationAttributes {
	__unsafe_unretained NSString *type;
} EducationAttributes;

extern const struct EducationRelationships {
	__unsafe_unretained NSString *concentration;
	__unsafe_unretained NSString *school;
	__unsafe_unretained NSString *year;
} EducationRelationships;

extern const struct EducationFetchedProperties {
} EducationFetchedProperties;

@class Concentration;
@class School;
@class Year;



@interface EducationID : NSManagedObjectID {}
@end

@interface _Education : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EducationID*)objectID;




@property (nonatomic, strong) NSString *type;


//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* concentration;

- (NSMutableSet*)concentrationSet;




@property (nonatomic, strong) School* school;

//- (BOOL)validateSchool:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Year* year;

//- (BOOL)validateYear:(id*)value_ error:(NSError**)error_;




@end

@interface _Education (CoreDataGeneratedAccessors)

- (void)addConcentration:(NSSet*)value_;
- (void)removeConcentration:(NSSet*)value_;
- (void)addConcentrationObject:(Concentration*)value_;
- (void)removeConcentrationObject:(Concentration*)value_;

@end

@interface _Education (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (NSMutableSet*)primitiveConcentration;
- (void)setPrimitiveConcentration:(NSMutableSet*)value;



- (School*)primitiveSchool;
- (void)setPrimitiveSchool:(School*)value;



- (Year*)primitiveYear;
- (void)setPrimitiveYear:(Year*)value;


@end
