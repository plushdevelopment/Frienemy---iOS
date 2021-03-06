//
//  FriendDetailGeneralTableViewCell.m
//  Frienemy
//
//  Created by Ross Chapman on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailGeneralTableViewCell.h"
#import "ImageRequest.h"
#import "StalkersViewController.h"

@implementation FriendDetailGeneralTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize locationLabel = _locationLabel;
@synthesize locationIconImageView = _locationIconImageView;
@synthesize profileImageView = _profileImageView;
@synthesize profileMaskImageView = _profileMaskImageView;
@synthesize activityIndicatorView = _activityIndicatorView;
@synthesize stalkingButton = _stalkingButton;
@synthesize stalkerRankLabel = _stalkerRankLabel;
@synthesize stalkersButton = _stalkersButton;
@synthesize friend = _friend;

- (void)configureCellForFriend:(Friend *)friend
{
    self.friend = friend;
    
    self.nameLabel.text = self.friend.name;
    if (friend.location) {
        self.locationLabel.text = self.friend.location.name;
        self.locationIconImageView.hidden = NO;
    } else if (friend.hometown) {
        self.locationLabel.text = self.friend.hometown.name;
        self.locationIconImageView.hidden = NO;
    } else {
        self.locationLabel.text = @"";
        self.locationIconImageView.hidden = YES;
    }
    
    self.stalkingButton.selected = self.friend.stalking.boolValue;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        UIImage *image = [UIImage imageWithContentsOfFile:[self.friend normalDownloadPath]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.profileImageView setImage:image];
            [self.profileImageView setClipsToBounds:YES];
            [self.profileMaskImageView setHidden:NO];
            [self setNeedsLayout];
        });
    });
    
    if (!self.profileImageView.image)
        [self.activityIndicatorView startAnimating];
    
    NSString *URLString = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=normal", self.friend.uid];
    ImageRequest *request = [ImageRequest requestWithURL:[NSURL URLWithString:URLString]];
    [request setDownloadDestinationPath:[self.friend normalDownloadPath]];
    [request setDelegate:self];
    [request setTimeOutSeconds:600];
    [request startAsynchronous];
    
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        UIImage *image = [UIImage imageWithContentsOfFile:[self.friend normalDownloadPath]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.profileImageView setImage:image];
            [self.profileImageView setClipsToBounds:YES];
            [self.profileMaskImageView setHidden:NO];
            [self.activityIndicatorView stopAnimating];
            [self setNeedsLayout];
        });
    });
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self.activityIndicatorView stopAnimating];
}


- (IBAction)toggleStalkState:(id)sender
{
    self.friend.stalking = [NSNumber numberWithBool:!self.friend.stalking.boolValue];
    self.stalkingButton.selected = self.friend.stalking.boolValue;
}


@end
