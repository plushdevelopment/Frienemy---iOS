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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
