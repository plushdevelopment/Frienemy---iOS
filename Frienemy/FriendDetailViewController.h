//
//  FriendDetailViewController.h
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Friend *friend;
@property (nonatomic, strong) NSArray *educationArray;
@property (nonatomic, strong) NSArray *workArray;

- (id)initWithFriend:(Friend *)friend;

@end
