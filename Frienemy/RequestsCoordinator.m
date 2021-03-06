//
//  RequestsCoordinator.m
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RequestsCoordinator.h"
#import "FriendsListRequest.h"
#import "UserRequest.h"
#import "WallRequest.h"
#import "ImageRequest.h"
#import "NSString+Encode.h"

@interface RequestsCoordinator (Private)
- (void)queueFinished:(ASINetworkQueue *)queue;
- (void)friendsRequestDidFinish:(FriendsListRequest *)request;
- (void)stalkerRequestDidFinish:(WallRequest *)request;
@end


@implementation RequestsCoordinator

@synthesize networkQueue = _networkQueue;
@synthesize downloadingImages = _downloadingImages;

+ (RequestsCoordinator *)sharedCoordinator
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Create the network queue and initialize property
		[self setNetworkQueue:[ASINetworkQueue queue]];
		[[self networkQueue] setDelegate:self];
        [[self networkQueue] setQueueDidFinishSelector:@selector(queueFinished:)];
		[[self networkQueue] setShouldCancelAllRequestsOnFailure:NO];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshFriends) name:PALoginFinishedNotification object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:PALoginFinishedNotification object:nil];
}

- (NSString *)downloadPathForUid:(NSString *)uid
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *iconPath = [documentsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg", uid]];
    return iconPath;
}

- (void)getProfileImagesForUids:(NSArray *)uids
{
    for (NSString *uid in uids) {
        NSString *URLString = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", uid];
        ImageRequest *request = [ImageRequest requestWithURL:[NSURL URLWithString:URLString]];
        [request setDownloadDestinationPath:[self downloadPathForUid:uid]];
        [request setDelegate:self];
        [request setTimeOutSeconds:600];
        [[self networkQueue] addOperation:request];
    }
    self.downloadingImages = YES;
    [[self networkQueue] go];
}

- (void)refreshFriends
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
    
    if (accessToken) {
		NSMutableString *queryString = [NSMutableString string];
		[queryString appendString:@"https://graph.facebook.com/fql?q="];
		[queryString appendString:@"{\"friendsList\":\""];
		[queryString appendString:FQLFriendsListQuery];
		[queryString appendString:@"\",\"currentUser\":\""];
		[queryString appendString:FQLCurrentUserQuery];
		[queryString appendString:@"\"}"];
		[queryString appendString:@"&access_token="];
		[queryString appendString:accessToken];
		NSString *encodedFql = [queryString urlencode];
        NSURL *url = [NSURL URLWithString:encodedFql];
		FriendsListRequest *request = [FriendsListRequest requestWithURL:url];
        [request setTimeOutSeconds:600];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(friendsRequestDidFinish:)];
        [request startAsynchronous];
    }
}


- (void)friendsRequestDidFinish:(FriendsListRequest *)request
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PAFriendsListFinishedNotification object:nil];
}

- (void)refreshStalkers
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
    
    if (accessToken) {
        
        NSString *urlString = [NSString 
                               stringWithFormat:@"https://graph.facebook.com/me/feed?access_token=%@&limit=50", 
                               [accessToken stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURL *url = [NSURL URLWithString:urlString];
        WallRequest *request = [WallRequest requestWithURL:url];
        [request setTimeOutSeconds:600];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(stalkerRequestDidFinish:)];
        [request startAsynchronous];
    }
}

- (void)stalkerRequestDidFinish:(WallRequest *)request
{
	[[NSNotificationCenter defaultCenter] postNotificationName:PAWallFinishedNotification object:nil];
}

#pragma mark -
#pragma mark ASIHTTPRequest Delegate Methods


- (void)requestFinished:(ASIHTTPRequest *)request
{
	//... Handle finished notification
}


- (void)requestFailed:(ASIHTTPRequest *)request
{
	//... Handle fail notification
}

- (void)queueFinished:(ASINetworkQueue *)queue
{
	[[self networkQueue] setSuspended:YES];
    
	if (self.downloadingImages) {
        [[NSNotificationCenter defaultCenter] postNotificationName:PAImageDownloadedNotification object:nil];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setValue:[NSDate date] forKey:PAImageDownloadedDateKey];
        self.downloadingImages = NO;
    }
}
	 
@end
