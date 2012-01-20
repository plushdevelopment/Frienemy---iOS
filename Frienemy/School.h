//
//  School.h
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Education;

@interface School : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSSet *educations;
@end

@interface School (CoreDataGeneratedAccessors)

- (void)addEducationsObject:(Education *)value;
- (void)removeEducationsObject:(Education *)value;
- (void)addEducations:(NSSet *)values;
- (void)removeEducations:(NSSet *)values;

@end
