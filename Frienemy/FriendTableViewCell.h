//
//  ThemeListCell.h
//  AppTheme
//
//  Created by Tope on 13/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIImageView *profileMaskImageView;
@property (strong, nonatomic) IBOutlet UILabel *frienemyLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *blueImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *profileImageActivityIndicator;

@end
