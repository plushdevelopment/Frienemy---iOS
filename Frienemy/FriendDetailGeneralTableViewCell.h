//
//  FriendDetailGeneralTableViewCell.h
//  Frienemy
//
//  Created by Ross Chapman on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"
#import "ASIHTTPRequestDelegate.h"

@interface FriendDetailGeneralTableViewCell : PRPNibBasedTableViewCell <ASIHTTPRequestDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UIImageView *locationIconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileMaskImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) Friend *friend;

- (void)configureCellForFriend:(Friend *)friend;

@end
