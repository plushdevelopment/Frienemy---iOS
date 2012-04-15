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
#import "FriendDetailEducationTableViewCell.h"

enum FriendDetailSectionIndex
{
    FDGeneralSection = 0,
    FDBasicSection,
    FDEducationSection,
    FDWorkSection,
    FDSectionsCount
};

enum FDBasicRowIndex
{
    FDBasicSexRow = 0,
    FDBasicBirthdayRow,
    FDBasicCurrentCityRow,
    FDBasicHometownRow,
    FDBasicRelationshipRow,
    FDBasicReligionRow,
    FDBasicPoliticsRow,
    FDBasicRowCount
};

@implementation FriendDetailViewController

@synthesize tableView = _tableView;
@synthesize friend = _friend;
@synthesize educationArray = _educationArray;
@synthesize workArray = _workArray;

- (id)initWithFriend:(Friend *)friend
{
    self = [self initWithNibName:@"FriendDetailViewController" bundle:nil];
    if (self) {
        self.friend = friend;
        NSSortDescriptor *educationSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"year.name" ascending:YES];
        self.educationArray = [self.friend.education.allObjects sortedArrayUsingDescriptors:[NSArray arrayWithObject:educationSortDescriptor]];
        NSSortDescriptor *workSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"start_date" ascending:YES];
		self.workArray = [self.friend.work.allObjects sortedArrayUsingDescriptors:[NSArray arrayWithObject:workSortDescriptor]];
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
    NSInteger row = indexPath.row;
    switch (section) {
        case FDGeneralSection:
        {
            FriendDetailGeneralTableViewCell *detailCell = (FriendDetailGeneralTableViewCell *)cell;
            [detailCell configureCellForFriend:self.friend];
        }
            break;
        case FDBasicSection:
        {
            switch (row) {
                case FDBasicSexRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Sex";
                    detailCell.fieldValueLabel.text = self.friend.gender;
                }
                    break;
                case FDBasicBirthdayRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Birthday";
                    detailCell.fieldValueLabel.text = self.friend.birthday;
                }    
                    break;
                case FDBasicCurrentCityRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Hometown";
                    detailCell.fieldValueLabel.text = self.friend.hometown.name;
                }   
                    break;
                case FDBasicHometownRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Current City";
                    detailCell.fieldValueLabel.text = self.friend.location.name;
                }
                    break;
                case FDBasicRelationshipRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Relationship Status";
                    detailCell.fieldValueLabel.text = self.friend.relationship_status;
                }   
                    break;
                case FDBasicReligionRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Religious Views";
                    detailCell.fieldValueLabel.text = self.friend.religion;
                }   
                    break;
                case FDBasicPoliticsRow:
                {
                    FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
                    detailCell.fieldKeyLabel.text = @"Political Views";
                    detailCell.fieldValueLabel.text = self.friend.political;
                }   
                    break;
                default:
                    break;
            }
        }
            break;
        case FDEducationSection:
        {
            FriendDetailEducationTableViewCell *detailCell = (FriendDetailEducationTableViewCell *)cell;
            Education *education = [self.educationArray objectAtIndex:row];
			[detailCell configureCellForEducation:education];
        }
            break;
        case FDWorkSection:
        {
            FriendDetailFieldTableViewCell *detailCell = (FriendDetailFieldTableViewCell *)cell;
            Work *work = [self.workArray objectAtIndex:row];
			detailCell.fieldKeyLabel.text = work.start_date;
			detailCell.fieldValueLabel.text = work.employer.name;
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
        case FDBasicSection:
        {
            cell = [FriendDetailFieldTableViewCell cellForTableView:tableView fromNib:[FriendDetailFieldTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        case FDEducationSection:
        {
            cell = [FriendDetailEducationTableViewCell cellForTableView:tableView fromNib:[FriendDetailEducationTableViewCell nib]];
            [self tableView:tableView configureCell:cell atIndexPath:indexPath];
        }
            break;
        case FDWorkSection:
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
        case FDBasicSection:
        {
            height = 46.0;
        }
            break;
        case FDEducationSection:
        {
            height = 46.0;
        }
            break;
        case FDWorkSection:
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
        case FDBasicSection:
        {
            rowsCount = FDBasicRowCount;
        }
            break;
        case FDEducationSection:
        {
            rowsCount = self.educationArray.count;
        }
            break;
        case FDWorkSection:
        {
            rowsCount = self.workArray.count;
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


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    switch (section) {
        case FDGeneralSection:
        {
            UIView *sectionView = [[UIView alloc] initWithFrame:CGRectZero];
			view = sectionView;
        }
            break;
        case FDBasicSection:
        {
            UIView *sectionView = [[UIView alloc] initWithFrame:CGRectZero];
			view = sectionView;
        }
            break;
        case FDEducationSection:
        {
            FriendDetailSectionView *sectionView = [FriendDetailSectionView sectionViewFromNib:[FriendDetailSectionView nib]];
            
            sectionView.titleLabel.text = @"Education";
            view = sectionView;
        }
            break;
        case FDWorkSection:
        {
            FriendDetailSectionView *sectionView = [FriendDetailSectionView sectionViewFromNib:[FriendDetailSectionView nib]];
            
            sectionView.titleLabel.text = @"Work";
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
    
    if ((section == FDGeneralSection) || (section == FDBasicSection)) {
        height = 0.0;
    } else {
		height = 25.0;
	}
    
    return height;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
