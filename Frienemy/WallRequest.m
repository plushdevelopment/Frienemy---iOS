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

- (void)requestFinished
{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_contextThatNotifiesDefaultContextOnMainThread];
	// Reset the stalking value for all friends
	NSPredicate *fetchPredicate = [NSPredicate predicateWithFormat:@"isFrienemy == NO AND isCurrentUsersFriend == YES"];
	NSArray *friends = [Friend MR_findAllWithPredicate:fetchPredicate inContext:context];
	[friends makeObjectsPerformSelector:@selector(setStalkingValue:) withObject:[NSNumber numberWithInt:0]];
	
	// Parse the response into arrays and dictionaries
    NSDictionary *jsonResponse = [[self responseString] JSONValue];
	NSArray *jsonArray = [jsonResponse valueForKey:@"data"];
	
	NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"from.id IN %@", [friends valueForKey:@"uid"]];
	NSPredicate *nullPredicate = [NSPredicate predicateWithFormat:@"self != NULL"];
	NSArray *wallPostArray = [jsonArray filteredArrayUsingPredicate:filterPredicate];
	NSArray *commentsArray = [[jsonArray valueForKeyPath:@"comments.data"] filteredArrayUsingPredicate:nullPredicate];
	NSArray *likesArray = [[jsonArray valueForKeyPath:@"likes.data"] filteredArrayUsingPredicate:nullPredicate];
    for (NSDictionary *wallPostDictionary in wallPostArray) {
		
	}
	for (NSArray *commentArray in commentsArray) {
		for (NSDictionary *commentDict in commentArray) {
			
		}
	}
	for (NSArray *likeArray in likesArray) {
		for (NSDictionary *likeDictionary in likeArray) {
			
		}
	}
	
	[super requestFinished];
}

@end
