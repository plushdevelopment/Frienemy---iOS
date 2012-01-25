//
//  FriendDetailViewController.m
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "ImageRequest.h"
#import "FriendDetailGeneralTableViewCell.h"
#import "FriendDetailFieldTableViewCell.h"

enum FriendDetailSectionIndex
{
    FDGeneralSection = 0,
    FDContactInfoSection,
    FDBasicSection,
    FDLikesAndInterestsSection,
    FDEducationAndWorkSection,
    FDSectionsCount
};

@implementation FriendDetailViewController

@synthesize tableView = _tableView;
@synthesize friend = _friend;

- (NSString *)downloadPathForUid:(NSString *)uid
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *iconPath = [documentsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-normal.jpg", uid]];
    return iconPath;
}

- (id)initWithFriend:(Friend *)friend
{
    self = [self initWithNibName:@"FriendDetailViewController" bundle:nil];
    if (self) {
        self.friend = friend;
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gunmetal.jpg"]];
    
    [self.view setBackgroundColor:color];
    
    NSString *URLString = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=normal", self.friend.uid];
    ImageRequest *request = [ImageRequest requestWithURL:[NSURL URLWithString:URLString]];
    [request setDownloadDestinationPath:[self downloadPathForUid:self.friend.uid]];
    [request setDelegate:self];
    [request setTimeOutSeconds:600];
    [request startAsynchronous];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    switch (section) {
        case FDGeneralSection:
        {
            
        }
            break;
        case FDContactInfoSection:
        {
            
        }
            break;
        case FDBasicSection:
        {
            
        }
            break;
        case FDLikesAndInterestsSection:
        {
            
        }
            break;
        case FDEducationAndWorkSection:
        {
            
        }
            break;
        default:
        {
            
        }
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSInteger section = indexPath.section;
    switch (section) {
        case FDGeneralSection:
        {
            cell = [FriendDetailGeneralTableViewCell cellForTableView:tableView fromNib:[FriendDetailGeneralTableViewCell nib]];
        }
            break;
        case FDContactInfoSection:
        {
            
        }
            break;
        case FDBasicSection:
        {
            
        }
            break;
        case FDLikesAndInterestsSection:
        {
            
        }
            break;
        case FDEducationAndWorkSection:
        {
            
        }
            break;
        default:
        {
            
        }
            break;
    }
    
    [self tableView:tableView configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0;
    NSInteger section = indexPath.section;
    switch (section) {
        case FDGeneralSection:
        {
            height = 223.0;
        }
            break;
        case FDContactInfoSection:
        {
            
        }
            break;
        case FDBasicSection:
        {
            
        }
            break;
        case FDLikesAndInterestsSection:
        {
            
        }
            break;
        case FDEducationAndWorkSection:
        {
            
        }
            break;
        default:
        {
            
        }
            break;
    }
    
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowsCount = 0;
    switch (section) {
        case FDGeneralSection:
        {
            rowsCount = 1;
        }
            break;
        case FDContactInfoSection:
        {
            
        }
            break;
        case FDBasicSection:
        {
            
        }
            break;
        case FDLikesAndInterestsSection:
        {
            
        }
            break;
        case FDEducationAndWorkSection:
        {
            
        }
            break;
        default:
        {
            
        }
            break;
    }
    
    return rowsCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return FDSectionsCount;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
