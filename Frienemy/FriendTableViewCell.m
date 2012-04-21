//
//  ThemeListCell.m
//  AppTheme
//
//  Created by Tope on 13/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

@synthesize profileImageView = _profileImageView;
@synthesize profileMaskImageView = _profileMaskImageView;
@synthesize frienemyLabel = _frienemyLabel;
@synthesize detailLabel = _detailLabel;
@synthesize nameLabel = _nameLabel;
@synthesize blueImageView = _blueImageView;
@synthesize profileImageActivityIndicator = _profileImageActivityIndicator;
@synthesize friend = _friend;
@synthesize request = _request;
@synthesize stalkButton = _stalkButton;

- (void)imageDidLoad:(UIImage *)image
{
    [[self profileImageActivityIndicator] stopAnimating];
    self.profileImageView.image = image;
    [[self profileMaskImageView] setHidden:NO];
}

- (void)loadImage
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        UIImage *image = [UIImage imageWithContentsOfFile:[self.friend downloadPath]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self imageDidLoad:image];
        });
    });
}

- (void)configureCellForFriend:(Friend *)friend
{
    if (self.request && [self.request isExecuting]) {
        [self.request cancel];
        self.request.delegate = nil;
        self.request = nil;
    }
    
    self.friend = friend;
    
    self.nameLabel.text = self.friend.name;
    if (friend.bio) {
        self.detailLabel.text = self.friend.bio;
    } else {
        self.detailLabel.text = self.friend.quotes;
    }
    
    [self.stalkButton setStalking:self.friend.stalking.boolValue];
    
    if (self.friend.stalking.boolValue) {
        self.stalkButton.hidden = NO;
    } else {
        self.stalkButton.hidden = YES;
    }
    
    //if (![self.profileImageView image]) {
        [self.profileImageActivityIndicator startAnimating];
        [self.profileMaskImageView setHidden:YES];
    //}
    
    [self loadImage];
    
    NSString *URLString = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", self.friend.uid];
    self.request = [ImageRequest requestWithURL:[NSURL URLWithString:URLString]];
    [self.request setDownloadDestinationPath:[self.friend downloadPath]];
    [self.request setDelegate:self];
    [self.request setTimeOutSeconds:600];
    [self.request startAsynchronous];
}

- (void)prepareForReuse
{
    if (self.request) {
        [self.request cancel];
        self.request.delegate = nil;
    }
    self.profileImageView.image = nil;
    [self.profileMaskImageView setHidden:YES];
    [self.profileImageActivityIndicator startAnimating];
}

- (void)dealloc
{
    if (self.request) {
        [self.request cancel];
        self.request.delegate = nil;
    }
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self loadImage];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self.profileImageActivityIndicator stopAnimating];
}

@end
