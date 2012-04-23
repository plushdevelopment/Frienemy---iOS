//
//  StalkerTableViewCell.m
//  Frienemy
//
//  Created by Ross Chapman on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StalkerTableViewCell.h"

@implementation StalkerTableViewCell

@synthesize profileImageView = _profileImageView;
@synthesize profileMaskImageView = _profileMaskImageView;
@synthesize frienemyLabel = _frienemyLabel;
@synthesize detailLabel = _detailLabel;
@synthesize nameLabel = _nameLabel;
@synthesize rankLabel = _rankLabel;
@synthesize blueImageView = _blueImageView;
@synthesize profileImageActivityIndicator = _profileImageActivityIndicator;
@synthesize relationship = _relationship;
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
        UIImage *image = [UIImage imageWithContentsOfFile:[self.relationship.fromFriend downloadPath]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self imageDidLoad:image];
        });
    });
}

- (void)configureCellForFriend:(StalkerRelationship *)relationship
{
    if (self.request && [self.request isExecuting]) {
        [self.request cancel];
        self.request.delegate = nil;
        self.request = nil;
    }
    
    self.relationship = relationship;
    
    self.nameLabel.text = self.relationship.fromFriend.name;
    self.detailLabel.text = [NSString stringWithFormat:@"%@ Recent Interactions", self.relationship.rank];
    
    [self.stalkButton setStalking:self.relationship.fromFriend.stalking.boolValue];
    
    if (self.relationship.fromFriend.stalking.boolValue) {
        self.stalkButton.hidden = NO;
    } else {
        self.stalkButton.hidden = YES;
    }
    
    [self.profileImageActivityIndicator startAnimating];
    [self.profileMaskImageView setHidden:YES];
    
    [self loadImage];
    
    NSString *URLString = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", self.relationship.fromFriend.uid];
    self.request = [ImageRequest requestWithURL:[NSURL URLWithString:URLString]];
    [self.request setDownloadDestinationPath:[self.relationship.fromFriend downloadPath]];
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
