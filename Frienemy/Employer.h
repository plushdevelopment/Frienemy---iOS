//
//  Employer.h
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Work;

@interface Employer : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *works;
@end

@interface Employer (CoreDataGeneratedAccessors)

- (void)addWorksObject:(Work *)value;
- (void)removeWorksObject:(Work *)value;
- (void)addWorks:(NSSet *)values;
- (void)removeWorks:(NSSet *)values;

@end
