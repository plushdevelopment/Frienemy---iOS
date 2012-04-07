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
#import "NSManagedObject+Additions.h"

@implementation FriendsListRequest

@synthesize uids = _uids;

- (void)requestFinished
{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_contextThatNotifiesDefaultContextOnMainThread];
    NSDictionary *jsonResponse = [[self responseString] JSONValue];
    NSArray *jsonFriendsArray = [jsonResponse objectForKey:@"data"];
    NSArray *jsonFriendsIDsArray = [jsonFriendsArray valueForKey:@"id"];
    //NSArray *friends = [Friend MR_findAllSortedBy:@"uid" ascending:YES inContext:context];
    NSPredicate *allFriendsPredicate = [NSPredicate predicateWithFormat:@"isCurrentUsersFriend == YES"];
    NSArray *friends = [Friend MR_findAllSortedBy:@"uid" ascending:YES withPredicate:allFriendsPredicate inContext:context];
    
    if (friends.count == 0) {
        // We have no friends so lets just save them all
        for (NSDictionary *jsonFriend in jsonFriendsArray) {
            Friend *friend = [Friend MR_createInContext:context];
            [friend PA_setValuesForKeysWithDictionary:jsonFriend dateFormatter:nil];
            friend.isCurrentUsersFriend = [NSNumber numberWithBool:YES];
        }
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
        NSPredicate *existingFriendsPredicate2 = [NSPredicate predicateWithFormat:@"id IN %@", [existingFriends valueForKey:@"uid"]];
        NSArray *existingJSONFriends = [jsonFriendsArray filteredArrayUsingPredicate:existingFriendsPredicate2];
        for (int i = 0; i < existingFriends.count; i++) {
            NSDictionary *friendDict = [existingJSONFriends objectAtIndex:i];
            Friend *friend = [existingFriends objectAtIndex:i];
            [friend PA_setValuesForKeysWithDictionary:friendDict dateFormatter:nil];
            friend.isFrienemy = [NSNumber numberWithBool:NO];
        }
        
        // Find all new friends and create Friend objects for them
        NSPredicate *newFriendPredicate = [NSPredicate predicateWithFormat:@"NOT (id IN %@)", [friends valueForKey:@"uid"]];
        NSArray *jsonNewFriendsArray = [jsonFriendsArray filteredArrayUsingPredicate:newFriendPredicate];
        for (NSDictionary *jsonFriend in jsonNewFriendsArray) {
            Friend *friend = [Friend MR_createInContext:context];
            [friend PA_setValuesForKeysWithDictionary:jsonFriend dateFormatter:nil];
            friend.isCurrentUsersFriend = [NSNumber numberWithBool:YES];
        }
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
