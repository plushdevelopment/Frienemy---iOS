//
//  FirstViewController.m
//  SocialBooTheme
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendTableViewCell.h"
#import "FriendDetailViewController.h"
#import "RequestsCoordinator.h"

@interface FriendsViewController (Private)
- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;
@end

@implementation FriendsViewController

@synthesize tableView = _tableView;
@synthesize accessToken = _accessToken;
@synthesize filteredResults = _filteredResults;
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)dealloc
{
    [self.fetchedResultsController setDelegate:nil];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Friends";
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gunmetal.jpg"]];
    
    [self.view setBackgroundColor:color];
    
    NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		// Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
	}
    
    [[self tableView] setContentOffset:CGPointMake(0, self.searchDisplayController.searchBar.frame.size.height)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Friend *friend = nil;
    if ([tableView isEqual:self.tableView]) {
        friend = (Friend *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    } else {
        friend = (Friend *)[self.filteredResults objectAtIndex:indexPath.row];
    }
    
    FriendTableViewCell *friendCell = (FriendTableViewCell *)cell;
    [friendCell configureCellForFriend:friend];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendTableViewCell *cell = [FriendTableViewCell cellForTableView:tableView fromNib:[FriendTableViewCell nib]];
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

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *indexArray = nil;
    if ([tableView isEqual:self.tableView]) {
        indexArray = [NSMutableArray arrayWithArray:[[self fetchedResultsController] sectionIndexTitles]];
	
        [indexArray insertObject:UITableViewIndexSearch atIndex:0];
    } else {
        
        indexArray = nil;
    }
	return indexArray;
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

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if ([tableView isEqual:self.tableView]) {
        if (title == UITableViewIndexSearch)
        {
            // if magnifying glass
            [tableView scrollRectToVisible:self.searchDisplayController.searchBar.frame animated:NO];
            return -1;
        }
        
        
        return [[self fetchedResultsController ] sectionForSectionIndexTitle:title atIndex:index - 1]; // subtract 1 due to search idx
    } else {
        return index;
    }
    
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Friend *friend = nil;
    if ([tableView isEqual:self.tableView]) {
        friend = [self.fetchedResultsController objectAtIndexPath:indexPath];
    } else {
        friend = [self.filteredResults objectAtIndex:indexPath.row];
    }
    FriendDetailViewController *detail = [[FriendDetailViewController alloc] initWithFriend:friend];
    
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - NSFetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Friend" inManagedObjectContext:[NSManagedObjectContext MR_defaultContext]];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isFrienemy == NO AND isCurrentUsersFriend == YES"];
	[fetchRequest setPredicate:predicate];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] 
                              initWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController = 
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                        managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:@"section" 
                                                   cacheName:@"Friends"];
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
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[c] %@"
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

@end
