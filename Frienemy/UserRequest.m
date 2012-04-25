//
//  UserRequest.m
//  Frienemy
//
//  Created by Ross Chapman on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserRequest.h"
#import "JSON.h"
#import "NSManagedObject+Additions.h"

@implementation UserRequest

- (void)requestFinished
{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_contextThatNotifiesDefaultContextOnMainThread];
    NSDictionary *jsonResponse = [[self responseString] JSONValue];
    
    Friend *friend = [Friend PA_managedObjectForProperty:@"isCurrentUser" value:[NSNumber numberWithBool:YES] inContext:context];
    [friend PA_setValuesForKeysWithDictionary:jsonResponse dateFormatter:nil ignoreRelationships:YES];
    friend.isCurrentUsersFriend = [NSNumber numberWithBool:NO];
    friend.isCurrentUser = [NSNumber numberWithBool:YES];
    
    NSError *saveError = nil;
    [context save:&saveError];
    if (saveError) {
        NSLog(@"%@", [saveError userInfo]);
    }
    
    [super requestFinished];
}

@end
