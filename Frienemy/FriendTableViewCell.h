//
//  ThemeListCell.h
//  AppTheme
//
//  Created by Tope on 13/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"
#import "ASIHTTPRequestDelegate.h"
#import "ImageRequest.h"

@interface FriendTableViewCell : PRPNibBasedTableViewCell <ASIHTTPRequestDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileMaskImageView;
@property (strong, nonatomic) IBOutlet UILabel *frienemyLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *blueImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *profileImageActivityIndicator;
@property (strong, nonatomic) Friend *friend;
@property (strong, nonatomic) ImageRequest *request;

- (void)configureCellForFriend:(Friend *)friend;

@end
