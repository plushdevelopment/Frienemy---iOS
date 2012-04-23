//
//  WallRequest.m
//  Frienemy
//
//  Created by Ross Chapman on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WallRequest.h"
#import "JSON.h"

@implementation WallRequest

@synthesize userUID = userUID_;

- (void)requestFinished
{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_contextThatNotifiesDefaultContextOnMainThread];
	
	// Reset the stalking value for all friends
	[StalkerRelationship MR_truncateAllInContext:context];
	
	// Parse the response into arrays and dictionaries
    NSDictionary *jsonResponse = [[self responseString] JSONValue];
	NSArray *jsonArray = [jsonResponse valueForKey:@"data"];
	
	// Fetch the current user so we dont stalk ourselves
	Friend *currentUser;
	if (self.userUID) {
		currentUser = [Friend MR_findFirstByAttribute:@"uid" withValue:self.userUID inContext:context];
	} else {
		currentUser = [Friend MR_findFirstByAttribute:@"isCurrentUser" withValue:[NSNumber numberWithBool:YES] inContext:context];
	}
	
	NSPredicate *relationshipPredicate = [NSPredicate predicateWithFormat:@"toFriend.uid == %@", currentUser.uid];
	
	for (NSDictionary *wallPostDictionary in jsonArray) {
		NSDictionary *fromDictionary = [wallPostDictionary valueForKey:@"from"];
		NSString *fromUID = [fromDictionary valueForKey:@"id"];
		if (fromUID && ![fromUID isEqualToString:currentUser.uid]) {
			NSPredicate *wallPostFriendPredicate = [NSPredicate predicateWithFormat:@"uid == %@", fromUID];
			Friend *wallPostFriend = [Friend MR_findFirstWithPredicate:wallPostFriendPredicate inContext:context];
			if (wallPostFriend) {
				StalkerRelationship *relationship = [[wallPostFriend.stalkingRelationships.allObjects filteredArrayUsingPredicate:relationshipPredicate] lastObject];
				if (!relationship) {
					relationship = [StalkerRelationship MR_createInContext:context];
					relationship.toFriend = currentUser;
					relationship.fromFriend = wallPostFriend;
				}
				relationship.rank = [NSNumber numberWithInteger:(relationship.rankValue + 1)];
			}
		}
		
		// Walk the comments
		for (NSDictionary *commentDictionary in [wallPostDictionary valueForKeyPath:@"comments.data"]) {
			NSDictionary *commentFromDictionary = [wallPostDictionary valueForKey:@"from"];
			NSString *commentFromUID = [commentFromDictionary valueForKey:@"id"];
			if (commentFromUID && ![commentFromUID isEqualToString:currentUser.uid]) {
				NSPredicate *commentFriendPredicate = [NSPredicate predicateWithFormat:@"uid == %@", commentFromUID];
				Friend *commentFriend = [Friend MR_findFirstWithPredicate:commentFriendPredicate inContext:context];
				if (commentFriend) {
					StalkerRelationship *commentRelationship = [[commentFriend.stalkingRelationships.allObjects filteredArrayUsingPredicate:relationshipPredicate] lastObject];
					if (!commentRelationship) {
						commentRelationship = [StalkerRelationship MR_createInContext:context];
						commentRelationship.toFriend = currentUser;
						commentRelationship.fromFriend = commentFriend;
					}
					commentRelationship.rank = [NSNumber numberWithInteger:(commentRelationship.rankValue + 1)];
				}
			}
		}
		
		// Walk the likes
		for (NSDictionary *likeDictionary in [wallPostDictionary valueForKeyPath:@"likes.data"]) {
			NSString *likeFromUID = [likeDictionary valueForKey:@"id"];
			if (likeFromUID && ![likeFromUID isEqualToString:currentUser.uid]) {
				NSPredicate *likeFriendPredicate = [NSPredicate predicateWithFormat:@"uid == %@", likeFromUID];
				Friend *likeFriend = [Friend MR_findFirstWithPredicate:likeFriendPredicate inContext:context];
				if (likeFriend) {
					StalkerRelationship *likeRelationship = [[likeFriend.stalkingRelationships.allObjects filteredArrayUsingPredicate:relationshipPredicate] lastObject];
					if (!likeRelationship) {
						likeRelationship = [StalkerRelationship MR_createInContext:context];
						likeRelationship.toFriend = currentUser;
						likeRelationship.fromFriend = likeFriend;
					}
					likeRelationship.rank = [NSNumber numberWithInteger:(likeRelationship.rankValue + 1)];
				}
			}
		}
		
	}
	
	NSError *saveError = nil;
    [context save:&saveError];
    if (saveError) {
        NSLog(@"%@", [saveError userInfo]);
    }
	
	[super requestFinished];
}

@end
