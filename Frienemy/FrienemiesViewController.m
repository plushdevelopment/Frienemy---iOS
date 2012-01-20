//
//  FrienemiesViewController.m
//  Frienemy
//
//  Created by Ross Chapman on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FrienemiesViewController.h"
#import "FriendTableViewCell.h"
#import "FriendDetailViewController.h"
#import "FriendsListRequest.h"

@implementation FrienemiesViewController

@synthesize tableView = _tableView;
@synthesize accessToken = _accessToken;
@synthesize friends = _friends;

- (void)refreshFriends
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
    
    if (self.accessToken) {
        NSString *fieldsString = @"&fields=id,name,gender,locale,languages,link,username,updated_time,bio,birthday,education,email,hometown,interested_in,location,political,quotes,relationship_status,religion,significant_other,website,work";
        NSString *urlString = [NSString 
                               stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@%@", 
                               [_accessToken stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], fieldsString];
        NSURL *url = [NSURL URLWithString:urlString];
        FriendsListRequest *request = [FriendsListRequest requestWithURL:url];
        [request setTimeOutSeconds:600];
        [request startAsynchronous];
    }
}

- (void)reloadData
{
    // Refresh friends array
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isFrienemy == YES"];
    self.friends = [Friend MR_findAllSortedBy:@"name" ascending:YES withPredicate:predicate];
    
    // Refresh View
    [self.tableView reloadData];
}

- (void)contextDidSave:(NSNotification *)notification
{
    [self reloadData];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Frienemies";
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gunmetal.jpg"]];
    
    [self.view setBackgroundColor:color];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contextDidSave:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self reloadData];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"FriendTableViewCell";    
    FriendTableViewCell *cell = (FriendTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* objects = [[NSBundle mainBundle] loadNibNamed:@"FriendTableViewCell" owner:self options:nil];
        
        for(id currentObject in objects)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (FriendTableViewCell *)currentObject;
                break;
            }
        }
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    Friend *friend = [self.friends objectAtIndex:indexPath.row];
    cell.nameLabel.text = friend.name;
    if (friend.isFrienemy.boolValue) {
        cell.frienemyLabel.text = @"Frienemy";
    } else {
        cell.frienemyLabel.text = @"Friend";
    }
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.friends.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendDetailViewController *detail = [[FriendDetailViewController alloc] initWithNibName:@"FriendDetailViewController" bundle:nil];
    
    [self.navigationController pushViewController:detail animated:YES];
    
    
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self reloadData];
}

@end
