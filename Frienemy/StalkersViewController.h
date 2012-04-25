//
//  StalkersViewController.h
//  Frienemy
//
//  Created by Ross Chapman on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsViewController.h"

@interface StalkersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, ASIHTTPRequestDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSArray *filteredResults;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) Friend *currentUser;
@property (nonatomic) BOOL canSelectRows;

- (id)initWithFriend:(Friend *)currentUser;

@end
