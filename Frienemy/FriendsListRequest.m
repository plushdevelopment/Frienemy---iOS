//
//  FriendsListRequest.m
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsListRequest.h"
#import "JSON.h"
#import "NSManagedObject+Additions.h"

@implementation FriendsListRequest

@synthesize uids = _uids;

- (void)save:(NSManagedObjectContext *)context
{
    NSError *saveError;
    saveError = nil;
    [context save:&saveError];
    if (saveError) {
        NSLog(@"%@", [saveError userInfo]);
    }
}

- (void)processFriends:(NSArray *)jsonFriendsArray context:(NSManagedObjectContext *)context
{
    NSArray *jsonFriendsIDsArray = [jsonFriendsArray valueForKey:@"uid"];
    NSPredicate *allFriendsPredicate = [NSPredicate predicateWithFormat:@"isCurrentUsersFriend == YES"];
    NSArray *friends = [Friend MR_findAllSortedBy:@"uid" ascending:YES withPredicate:allFriendsPredicate inContext:context];
    
    if (friends.count == 0) {
        // We have no friends so lets just save them all
        for (NSDictionary *jsonFriend in jsonFriendsArray) {
            Friend *friend = [Friend PA_managedObjectForProperty:@"uid" value:[jsonFriend valueForKey:@"uid"] inContext:context];
            [friend PA_setValuesForKeysWithDictionary:jsonFriend dateFormatter:nil ignoreRelationships:NO];
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
        NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
        NSPredicate *existingFriendsPredicate = [NSPredicate predicateWithFormat:@"uid IN %@", jsonFriendsIDsArray];
        NSArray *existingFriends = [[friends filteredArrayUsingPredicate:existingFriendsPredicate] sortedArrayUsingDescriptors:sortDescriptors];
        NSPredicate *existingFriendsPredicate2 = [NSPredicate predicateWithFormat:@"uid IN %@", [existingFriends valueForKey:@"uid"]];
        NSArray *existingJSONFriends = [[jsonFriendsArray filteredArrayUsingPredicate:existingFriendsPredicate2] sortedArrayUsingDescriptors:sortDescriptors];
        NSAssert((existingFriends.count == existingJSONFriends.count), @"Friend counts must match");
        for (int i = 0; i < existingFriends.count; i++) {
            NSDictionary *friendDict = [existingJSONFriends objectAtIndex:i];
            Friend *friend = [existingFriends objectAtIndex:i];
            [friend PA_setValuesForKeysWithDictionary:friendDict dateFormatter:nil ignoreRelationships:YES];
            friend.isFrienemy = [NSNumber numberWithBool:NO];
        }
        
        // Find all new friends and create Friend objects for them
        NSPredicate *newFriendPredicate = [NSPredicate predicateWithFormat:@"NOT (uid IN %@)", [friends valueForKey:@"uid"]];
        NSArray *jsonNewFriendsArray = [jsonFriendsArray filteredArrayUsingPredicate:newFriendPredicate];
        for (NSDictionary *jsonFriend in jsonNewFriendsArray) {
            Friend *friend = [Friend PA_managedObjectForProperty:@"uid" value:[jsonFriend valueForKey:@"uid"] inContext:context];
            [friend PA_setValuesForKeysWithDictionary:jsonFriend dateFormatter:nil ignoreRelationships:NO];
            friend.isCurrentUsersFriend = [NSNumber numberWithBool:YES];
        }
    }
    // Save after processing friends
	[self save:context];
	
    self.uids = [[Friend MR_findAll] valueForKey:@"uid"];
}

- (void)processCurrentUser:(NSArray *)jsonCurrentUserArray context:(NSManagedObjectContext *)context
{
	// Current User
    NSDictionary *jsonCurrentUser = [jsonCurrentUserArray objectAtIndex:0];
	Friend *currentUser = [Friend PA_managedObjectForProperty:@"isCurrentUser" value:[NSNumber numberWithBool:YES] inContext:context];
    [currentUser PA_setValuesForKeysWithDictionary:jsonCurrentUser dateFormatter:nil ignoreRelationships:YES];
    currentUser.isCurrentUsersFriend = [NSNumber numberWithBool:NO];
    currentUser.isCurrentUser = [NSNumber numberWithBool:YES];
	
	// Save after processing current user
	[self save:context];
}

- (void)requestFinished
{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_contextThatNotifiesDefaultContextOnMainThread];
    NSDictionary *jsonResponse = [[self responseString] JSONValue];
	NSArray *jsonArray = [jsonResponse valueForKey:@"data"];

	for (NSDictionary *dictionary in jsonArray) {
		
		if ([[dictionary valueForKey:@"name"] isEqualToString:@"currentUser"])
			[self processCurrentUser:[dictionary valueForKey:@"fql_result_set"] context:context];
		
		if ([[dictionary valueForKey:@"name"] isEqualToString:@"friendsList"])
			[self processFriends:[dictionary valueForKey:@"fql_result_set"] context:context];
		
	}
    
    [super requestFinished];
}

@end
