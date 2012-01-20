//
//  FriendsListRequest.m
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsListRequest.h"
#import "JSON.h"
#import "RequestsCoordinator.h"

@implementation FriendsListRequest

@synthesize uids = _uids;

- (void)requestFinished
{
    NSLog(@"%@", [self responseString]);
    NSManagedObjectContext *context = [NSManagedObjectContext MR_contextForCurrentThread];
    NSDictionary *jsonResponse = [[self responseString] JSONValue];
    NSArray *jsonFriendsArray = [jsonResponse objectForKey:@"data"];
    NSArray *jsonFriendsIDsArray = [jsonFriendsArray valueForKey:@"id"];
    NSArray *friends = [Friend MR_findAllSortedBy:@"uid" ascending:YES inContext:context];
    
    if (friends.count == 0) {
        // We have no friends so lets just save them all
       friends = [Friend importFriendsInContext:context withArray:jsonFriendsArray];
    } else {
        
        // Find out which friends are frienemies now
        NSPredicate *frienemyPredicate = [NSPredicate predicateWithFormat:@"NOT (uid IN %@)", jsonFriendsIDsArray];
        NSArray *frienemies = [friends filteredArrayUsingPredicate:frienemyPredicate];
        for (Friend *frienemy in frienemies) {
            frienemy.isFrienemy = [NSNumber numberWithBool:YES];
        }
        
        // Find all the friends that already exist and set their isFrienemy flag to no
        NSPredicate *existingFriendsPredicate = [NSPredicate predicateWithFormat:@"uid IN %@", jsonFriendsIDsArray];
        
        NSArray *existingFriends = [friends filteredArrayUsingPredicate:existingFriendsPredicate];
        for (Friend *existingFriend in existingFriends) {
            existingFriend.isFrienemy = [NSNumber numberWithBool:NO];
        }
        NSPredicate *existingFriendsPredicate2 = [NSPredicate predicateWithFormat:@"id IN %@", [existingFriends valueForKey:@"uid"]]; 
        [Friend updateFriends:existingFriends withArray:[jsonFriendsArray filteredArrayUsingPredicate:existingFriendsPredicate2]];
        
        // Find all new friends and create Friend objects for them
        NSPredicate *newFriendPredicate = [NSPredicate predicateWithFormat:@"NOT (id IN %@)", [friends valueForKey:@"uid"]];
        NSArray *jsonNewFriendsArray = [jsonFriendsArray filteredArrayUsingPredicate:newFriendPredicate];
        NSArray *newFriends = [Friend importFriendsInContext:context withArray:jsonNewFriendsArray];
    }
    NSError *saveError = nil;
    [context save:&saveError];
    if (saveError) {
        NSLog(@"%@", [saveError userInfo]);
    }
    self.uids = [[Friend MR_findAll] valueForKey:@"uid"];
    
    [super requestFinished];
}

@end
