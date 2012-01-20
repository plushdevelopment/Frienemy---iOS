//
//  SocialBooViewController.h
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"

@interface FriendsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, ASIHTTPRequestDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSArray *filteredResults;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
