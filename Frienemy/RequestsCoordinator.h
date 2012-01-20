//
//  RequestsCoordinator.h
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
#import "ASIHTTPRequestDelegate.h"

@interface RequestsCoordinator : NSObject <ASIHTTPRequestDelegate>

@property (nonatomic, strong) ASINetworkQueue *networkQueue;
@property (nonatomic) BOOL downloadingImages;

+ (RequestsCoordinator *)sharedCoordinator;

- (void)getProfileImagesForUids:(NSArray *)uids;
- (void)refreshFriends;

@end
