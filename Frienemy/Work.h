//
//  Work.h
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employer, Friend, Location, Position;

@interface Work : NSManagedObject

@property (nonatomic, retain) NSString * start_date;
@property (nonatomic, retain) NSString * end_date;
@property (nonatomic, retain) NSString * work_description;
@property (nonatomic, retain) Employer *employer;
@property (nonatomic, retain) Friend *friend;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) Position *position;

@end
