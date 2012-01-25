//
//  FriendDetailViewController.h
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"

@interface FriendDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ASIHTTPRequestDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Friend *friend;

- (id)initWithFriend:(Friend *)friend;

@end
