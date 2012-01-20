//
//  Education.h
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Concentration, School, Year;

@interface Education : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) School *school;
@property (nonatomic, retain) Year *year;
@property (nonatomic, retain) NSSet *concentration;
@end

@interface Education (CoreDataGeneratedAccessors)

- (void)addConcentrationObject:(Concentration *)value;
- (void)removeConcentrationObject:(Concentration *)value;
- (void)addConcentration:(NSSet *)values;
- (void)removeConcentration:(NSSet *)values;

@end
