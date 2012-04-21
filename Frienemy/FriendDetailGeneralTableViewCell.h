//
//  FriendDetailGeneralTableViewCell.h
//  Frienemy
//
//  Created by Ross Chapman on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"
#import "ASIHTTPRequestDelegate.h"
#import "StalkButton.h"

@interface FriendDetailGeneralTableViewCell : PRPNibBasedTableViewCell <ASIHTTPRequestDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UIImageView *locationIconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileMaskImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) IBOutlet StalkButton *stalkButton;
@property (strong, nonatomic) IBOutlet UILabel *stalkingLabel;

@property (strong, nonatomic) Friend *friend;

- (void)configureCellForFriend:(Friend *)friend;
- (IBAction)toggleStalkState:(id)sender;

@end
