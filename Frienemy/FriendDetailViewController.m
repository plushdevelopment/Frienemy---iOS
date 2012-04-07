//
//  FriendDetailViewController.m
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "FriendDetailGeneralTableViewCell.h"
#import "FriendDetailFieldTableViewCell.h"
#import "FriendDetailSectionView.h"

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


#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    switch (section) {
        case FDGeneralSection:
        {
            FriendDetailGeneralTableViewCell *detailCell = (FriendDetailGeneralTableViewCell *)cell;
            [detailCell configureCellForFriend:self.friend];
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
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        case FDContactInfoSection:
        {
            cell = [FriendDetailFieldTableViewCell cellForTableView:tableView fromNib:[FriendDetailFieldTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        case FDBasicSection:
        {
            cell = [FriendDetailFieldTableViewCell cellForTableView:tableView fromNib:[FriendDetailFieldTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        case FDLikesAndInterestsSection:
        {
            cell = [FriendDetailFieldTableViewCell cellForTableView:tableView fromNib:[FriendDetailFieldTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        case FDEducationAndWorkSection:
        {
            cell = [FriendDetailFieldTableViewCell cellForTableView:tableView fromNib:[FriendDetailFieldTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        default:
        {
            cell = [FriendDetailFieldTableViewCell cellForTableView:tableView fromNib:[FriendDetailFieldTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
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
            height = 118.0;
        }
            break;
        case FDContactInfoSection:
        {
            height = 46.0;
        }
            break;
        case FDBasicSection:
        {
            height = 46.0;
        }
            break;
        case FDLikesAndInterestsSection:
        {
            height = 46.0;
        }
            break;
        case FDEducationAndWorkSection:
        {
            height = 46.0;
        }
            break;
        default:
        {
            height = 46.0;
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
            rowsCount = 1;
        }
            break;
        case FDBasicSection:
        {
            rowsCount = 1;
        }
            break;
        case FDLikesAndInterestsSection:
        {
            rowsCount = 1;
        }
            break;
        case FDEducationAndWorkSection:
        {
            rowsCount = 1;
        }
            break;
        default:
        {
            rowsCount = 0;
        }
            break;
    }
    
    return rowsCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return FDSectionsCount;
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    switch (section) {
        case FDGeneralSection:
        {
            
        }
            break;
        case FDContactInfoSection:
        {
            FriendDetailSectionView *sectionView = [FriendDetailSectionView sectionViewFromNib:[FriendDetailSectionView nib]];
            
            sectionView.titleLabel.text = @"Contact Info";
            view = sectionView;
        }
            break;
        case FDBasicSection:
        {
            FriendDetailSectionView *sectionView = [FriendDetailSectionView sectionViewFromNib:[FriendDetailSectionView nib]];
            
            sectionView.titleLabel.text = @"Basic Info";
            view = sectionView;
        }
            break;
        case FDLikesAndInterestsSection:
        {
            FriendDetailSectionView *sectionView = [FriendDetailSectionView sectionViewFromNib:[FriendDetailSectionView nib]];
            
            sectionView.titleLabel.text = @"Likes & Interests";
            view = sectionView;
        }
            break;
        case FDEducationAndWorkSection:
        {
            FriendDetailSectionView *sectionView = [FriendDetailSectionView sectionViewFromNib:[FriendDetailSectionView nib]];
            
            sectionView.titleLabel.text = @"Education & Work";
            view = sectionView;
        }
            break;
        default:
        {
            
        }
            break;
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 0.0;
    
    if (section != FDGeneralSection) {
        height = 25.0;
    }
    
    return height;
}
 */

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
