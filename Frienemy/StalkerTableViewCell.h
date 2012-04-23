//
//  StalkerTableViewCell.h
//  Frienemy
//
//  Created by Ross Chapman on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"
#import "ASIHTTPRequestDelegate.h"
#import "ImageRequest.h"
#import "SmallerStalkButton.h"

@interface StalkerTableViewCell : PRPNibBasedTableViewCell <ASIHTTPRequestDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileMaskImageView;
@property (strong, nonatomic) IBOutlet UILabel *frienemyLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rankLabel;
@property (strong, nonatomic) IBOutlet UIImageView *blueImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *profileImageActivityIndicator;
@property (strong, nonatomic) StalkerRelationship *relationship;
@property (strong, nonatomic) ImageRequest *request;
@property (strong, nonatomic) IBOutlet SmallerStalkButton *stalkButton;

- (void)configureCellForFriend:(StalkerRelationship *)relationship;

@end
