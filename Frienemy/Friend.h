//
//  Friend.h
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StalkerRelationship, User, Location, Language;

@interface Friend : NSManagedObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * uid;
@property (nonatomic, strong) NSNumber * isFrienemy;
@property (nonatomic, strong) NSNumber * isCurrentUser;
@property (nonatomic, strong) NSNumber * stalking;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSSet *stalkers;
@property (nonatomic, strong) NSSet *stalkingRelationships;
@property (nonatomic, strong) NSString * bio;
@property (nonatomic, strong) NSString * birthday;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * locale;
@property (nonatomic, strong) NSString * quotes;
@property (nonatomic, strong) NSString * relationship_status;
@property (nonatomic, strong) NSString * updated_time;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * website;
@property (nonatomic, strong) NSSet *languages;
@property (nonatomic, strong) NSSet *work;
@property (nonatomic, strong) NSString * hometown;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * significant_other;
@property (nonatomic, retain) NSString * section;

+ (NSArray *)importFriendsInContext:(NSManagedObjectContext *)context withArray:(NSArray *)array;
+ (void)updateFriends:(NSArray *)friends withArray:(NSArray *)array;

@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addStalkersObject:(StalkerRelationship *)value;
- (void)removeStalkersObject:(StalkerRelationship *)value;
- (void)addStalkers:(NSSet *)values;
- (void)removeStalkers:(NSSet *)values;

- (void)addStalkingRelationshipsObject:(StalkerRelationship *)value;
- (void)removeStalkingRelationshipsObject:(StalkerRelationship *)value;
- (void)addStalkingRelationships:(NSSet *)values;
- (void)removeStalkingRelationships:(NSSet *)values;

- (void)addLanguagesObject:(Language *)value;
- (void)removeLanguagesObject:(Language *)value;
- (void)addLanguages:(NSSet *)values;
- (void)removeLanguages:(NSSet *)values;

- (void)addWorkObject:(Work *)value;
- (void)removeWorkObject:(Work *)value;
- (void)addWork:(NSSet *)values;
- (void)removeWork:(NSSet *)values;

@end