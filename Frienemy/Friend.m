//
//  Friend.m
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Friend.h"
#import "StalkerRelationship.h"
#import "User.h"
#import "Location.h"
#import "Language.h"

@implementation Friend

@dynamic name;
@dynamic uid;
@dynamic isFrienemy;
@dynamic isCurrentUser;
@dynamic stalking;
@dynamic user;
@dynamic stalkers;
@dynamic stalkingRelationships;
@dynamic bio;
@dynamic birthday;
@dynamic gender;
@dynamic link;
@dynamic locale;
@dynamic quotes;
@dynamic relationship_status;
@dynamic updated_time;
@dynamic username;
@dynamic website;
@dynamic hometown;
@dynamic languages;
@dynamic location;
@dynamic significant_other;
@dynamic work;
@dynamic section;

+ (NSArray *)importFriendsInContext:(NSManagedObjectContext *)context withArray:(NSArray *)array
{
    NSMutableArray *friends = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *friendDict in array) {
        Friend *friend = [Friend MR_createInContext:context];
        
        NSString *name = [friendDict valueForKey:@"name"];
        NSString *uid = [friendDict valueForKey:@"id"];
        NSString *bio = [friendDict valueForKey:@"bio"];
        NSString *birthday = [friendDict valueForKey:@"birthday"];
        NSString *gender = [friendDict valueForKey:@"gender"];
        NSString *link = [friendDict valueForKey:@"link"];
        NSString *locale = [friendDict valueForKey:@"locale"];
        NSString *quotes = [friendDict valueForKey:@"quotes"];
        NSString *relationship_status = [friendDict valueForKey:@"relationship_status"];
        NSString *updated_time = [friendDict valueForKey:@"updated_time"];
        NSString *username = [friendDict valueForKey:@"username"];
        NSString *website = [friendDict valueForKey:@"website"];
        NSString *hometown = [[friendDict objectForKey:@"hometown"] valueForKey:@"name"];
        NSString *location = [[friendDict objectForKey:@"location"] valueForKey:@"name"];
        NSString *significant_other = [[friendDict objectForKey:@"significant_other"] valueForKey:@"name"];
        
        friend.name = name;
        friend.section = [friend.name substringToIndex:1];
        friend.uid = uid;
        if ([bio isKindOfClass:[NSString class]]) { friend.bio = bio; }
        if ([birthday isKindOfClass:[NSString class]]) { friend.birthday = birthday; }
        if ([gender isKindOfClass:[NSString class]]) { friend.gender = gender; }
        if ([link isKindOfClass:[NSString class]]) { friend.link = link; }
        if ([locale isKindOfClass:[NSString class]]) { friend.locale = locale; }
        if ([quotes isKindOfClass:[NSString class]]) { friend.quotes = quotes; }
        if ([relationship_status isKindOfClass:[NSString class]]) { friend.relationship_status = relationship_status; }
        if ([updated_time isKindOfClass:[NSString class]]) { friend.updated_time = updated_time; }
        if ([username isKindOfClass:[NSString class]]) { friend.username = username; }
        if ([website isKindOfClass:[NSString class]]) { friend.website = website; }
        if ([hometown isKindOfClass:[NSString class]]) { friend.hometown = hometown; }
        if ([location isKindOfClass:[NSString class]]) { friend.location = location; }
        if ([significant_other isKindOfClass:[NSString class]]) { friend.significant_other = significant_other; }
        
        [friends addObject:friend];
        
    }
    return [NSArray arrayWithArray:friends];
}

+ (void)updateFriends:(NSArray *)friends withArray:(NSArray *)array
{
    for (int i = 0; i < friends.count; i++) {
        
        NSDictionary *friendDict = [array objectAtIndex:i];
        Friend *friend = [friends objectAtIndex:i];
        
        NSString *name = [friendDict valueForKey:@"name"];
        NSString *uid = [friendDict valueForKey:@"id"];
        NSString *bio = [friendDict valueForKey:@"bio"];
        NSString *birthday = [friendDict valueForKey:@"birthday"];
        NSString *gender = [friendDict valueForKey:@"gender"];
        NSString *link = [friendDict valueForKey:@"link"];
        NSString *locale = [friendDict valueForKey:@"locale"];
        NSString *quotes = [friendDict valueForKey:@"quotes"];
        NSString *relationship_status = [friendDict valueForKey:@"relationship_status"];
        NSString *updated_time = [friendDict valueForKey:@"updated_time"];
        NSString *username = [friendDict valueForKey:@"username"];
        NSString *website = [friendDict valueForKey:@"website"];
        NSString *hometown = [[friendDict objectForKey:@"hometown"] valueForKey:@"name"];
        NSString *location = [[friendDict objectForKey:@"location"] valueForKey:@"name"];
        NSString *significant_other = [[friendDict objectForKey:@"significant_other"] valueForKey:@"name"];
        
        friend.name = name;
        friend.section = [friend.name substringToIndex:1];
        friend.uid = uid;
        if ([bio isKindOfClass:[NSString class]]) { friend.bio = bio; }
        if ([birthday isKindOfClass:[NSString class]]) { friend.birthday = birthday; }
        if ([gender isKindOfClass:[NSString class]]) { friend.gender = gender; }
        if ([link isKindOfClass:[NSString class]]) { friend.link = link; }
        if ([locale isKindOfClass:[NSString class]]) { friend.locale = locale; }
        if ([quotes isKindOfClass:[NSString class]]) { friend.quotes = quotes; }
        if ([relationship_status isKindOfClass:[NSString class]]) { friend.relationship_status = relationship_status; }
        if ([updated_time isKindOfClass:[NSString class]]) { friend.updated_time = updated_time; }
        if ([username isKindOfClass:[NSString class]]) { friend.username = username; }
        if ([website isKindOfClass:[NSString class]]) { friend.website = website; }
        if ([hometown isKindOfClass:[NSString class]]) { friend.hometown = hometown; }
        if ([location isKindOfClass:[NSString class]]) { friend.location = location; }
        if ([significant_other isKindOfClass:[NSString class]]) { friend.significant_other = significant_other; }
        
    }
}

@end
