//
//  StalkersViewController.m
//  Frienemy
//
//  Created by Ross Chapman on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StalkersViewController.h"
#import "FriendDetailViewController.h"
#import "StalkerTableViewCell.h"
#import "WallRequest.h"

@interface StalkersViewController ()
- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;
@end

@implementation StalkersViewController

@synthesize tableView = _tableView;
@synthesize accessToken = _accessToken;
@synthesize filteredResults = _filteredResults;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize currentUser = _currentUser;

- (id)initWithFriend:(Friend *)currentUser
{
	self = [self initWithNibName:@"StalkersViewController" bundle:nil];
	if (self) {
		self.currentUser = currentUser;
	}
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"Stalkers";
    
	UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gunmetal.jpg"]];
    [self.view setBackgroundColor:color];
	
	if (!self.currentUser)
		self.currentUser = [Friend MR_findFirstByAttribute:@"isCurrentUser" withValue:[NSNumber numberWithBool:YES]];
    
    NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		// Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
	}
    
    [[self tableView] setContentOffset:CGPointMake(0, self.searchDisplayController.searchBar.frame.size.height)];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
    
    if (accessToken) {
        
        NSString *urlString = [NSString 
                               stringWithFormat:@"https://graph.facebook.com/%@/feed?access_token=%@&limit=50", self.currentUser.uid, 
                               [accessToken stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURL *url = [NSURL URLWithString:urlString];
        WallRequest *request = [WallRequest requestWithURL:url];
		[request setUserUID:self.currentUser.uid];
        [request setTimeOutSeconds:600];
        [request setDelegate:self];
        [request setDidFinishSelector:@selector(requestFinished:)];
        [request startAsynchronous];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    StalkerRelationship *relationship = nil;
    if ([tableView isEqual:self.tableView]) {
        relationship = (StalkerRelationship *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    } else {
        relationship = (StalkerRelationship *)[self.filteredResults objectAtIndex:indexPath.row];
    }
    
    StalkerTableViewCell *friendCell = (StalkerTableViewCell *)cell;
    [friendCell configureCellForFriend:relationship];
	friendCell.rankLabel.text = [NSString stringWithFormat:@"%d", (indexPath.row + 1)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StalkerTableViewCell *cell = [StalkerTableViewCell cellForTableView:tableView fromNib:[StalkerTableViewCell nib]];
    [self tableView:tableView configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowsCount = 0;
    if ([tableView isEqual:self.tableView]) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
        rowsCount = [sectionInfo numberOfObjects];
    } else {
        rowsCount = self.filteredResults.count;
    }
    return rowsCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger rowsCount = 0;
    if ([tableView isEqual:self.tableView]) {
        rowsCount = self.fetchedResultsController.sections.count;
    } else {
        rowsCount = 1;
    }
    return rowsCount;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Friend *friend = nil;
    if ([tableView isEqual:self.tableView]) {
        friend = [(StalkerRelationship *)[self.fetchedResultsController objectAtIndexPath:indexPath] fromFriend];
    } else {
        friend = [(StalkerRelationship *)[self.filteredResults objectAtIndex:indexPath.row] fromFriend];
    }
    FriendDetailViewController *detail = [[FriendDetailViewController alloc] initWithFriend:friend];
    
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - NSFetchedResultsController

- (NSPredicate *)fetchPredicate
{
    return [NSPredicate predicateWithFormat:@"toFriend == %@", self.currentUser];
}

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"StalkerRelationship" inManagedObjectContext:[NSManagedObjectContext MR_defaultContext]];
    [fetchRequest setEntity:entity];
    
    
	[fetchRequest setPredicate:[self fetchPredicate]];
    
    NSSortDescriptor *rankSort = [[NSSortDescriptor alloc] 
                              initWithKey:@"rank" ascending:NO];
	NSSortDescriptor *nameSort = [NSSortDescriptor sortDescriptorWithKey:@"fromFriend.name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:rankSort, nameSort, nil]];
    
    [fetchRequest setFetchBatchSize:20];
	
    NSFetchedResultsController *theFetchedResultsController = 
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                        managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:nil 
                                                   cacheName:nil];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;    
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self tableView:tableView configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
}

#pragma mark - Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fromFriend.name CONTAINS[c] %@"
                                                argumentArray:[NSArray arrayWithObject:searchText]];
	
	self.filteredResults = [self.fetchedResultsController.fetchedObjects filteredArrayUsingPredicate:predicate];
}

#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
	[self filterContentForSearchText:searchString scope:
	 [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
	[self.searchDisplayController.searchResultsTableView setBackgroundColor:[UIColor blackColor]];
    [self.searchDisplayController.searchResultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	// Return YES to cause the search result table view to be reloaded.
	return YES;
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
	[self.tableView reloadData];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	[self.tableView reloadData];
}

@end
