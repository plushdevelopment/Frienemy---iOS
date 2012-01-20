//
//  FrienemiesViewController.h
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"

@interface FrienemiesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ASIHTTPRequestDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSArray *friends;

- (void)refreshFriends;
- (void)reloadData;

@end
