//
//  FriendDetailViewController.h
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"

@interface FriendDetailViewController : UIViewController <ASIHTTPRequestDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) Friend *friend;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastUpdatedLabel;
@property (strong, nonatomic) IBOutlet UITextView *bioTextView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *profileImageActivityIndicator;

- (id)initWithFriend:(Friend *)friend;

@end
