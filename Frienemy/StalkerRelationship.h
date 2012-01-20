//
//  StalkerRelationship.h
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface StalkerRelationship : NSManagedObject

@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) Friend *toFriend;
@property (nonatomic, retain) Friend *fromFriend;

@end
