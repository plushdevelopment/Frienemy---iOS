//
//  FriendDetailViewController.m
//  SocialBoo
//
//  Created by Tope on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "ImageRequest.h"

@implementation FriendDetailViewController
@synthesize scrollView = _scrollView;
@synthesize friend = _friend;
@synthesize profileImageView = _profileImageView;
@synthesize nameLabel = _friendName;
@synthesize locationLabel = _location;
@synthesize lastUpdatedLabel = _lastUpdatedLabel;
@synthesize bioTextView = _bioLabel;
@synthesize profileImageActivityIndicator = _profileImageActivityIndicator;

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
    self.scrollView.contentSize = CGSizeMake(320, 500);
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [self.navigationItem setRightBarButtonItem:editButton];
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gunmetal.jpg"]];
    
    [self.view setBackgroundColor:color];

    self.nameLabel.text = self.friend.name;
    self.locationLabel.text = self.friend.location;
    self.lastUpdatedLabel.text = self.friend.updated_time;
    self.bioTextView.text = self.friend.bio;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        UIImage *image = [UIImage imageWithContentsOfFile:[self downloadPathForUid:self.friend.uid]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.profileImageView setImage:image];
            [self.view setNeedsLayout];
        });
    });
    
    if (self.profileImageView.image) {
        [self.profileImageActivityIndicator stopAnimating];
    } else {
        [self.profileImageActivityIndicator startAnimating];
    }
    
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
    [self setScrollView:nil];
    [self setProfileImageView:nil];
    [self setNameLabel:nil];
    [self setLocationLabel:nil];
    [self setLastUpdatedLabel:nil];
    [self setBioTextView:nil];
    [self setProfileImageActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        UIImage *image = [UIImage imageWithContentsOfFile:[self downloadPathForUid:self.friend.uid]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.profileImageView setImage:image];
            [self.view setNeedsLayout];
        });
    });
    [self.profileImageActivityIndicator stopAnimating];
}

@end
