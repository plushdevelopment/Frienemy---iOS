//
//  LoginViewController.m
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "PAAppDelegate.h"
#import "Facebook.h"

@implementation LoginViewController

@synthesize activityIndicatorView = _activityIndicatorView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self.activityIndicatorView selector:@selector(stopAnimating) name:PALoginFinishedNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self.activityIndicatorView];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)facebookLogin:(id)sender
{
    [self.activityIndicatorView startAnimating];
    
    PAAppDelegate *appDelegate = (PAAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (![appDelegate.facebook isSessionValid]) {
        NSArray *permissions = [NSArray arrayWithObjects:@"read_stream", 
                                @"offline_access", 
                                @"friends_relationships", 
                                @"friends_relationship_details", 
                                @"user_relationships", 
                                @"user_relationship_details", 
                                @"friends_likes", 
                                @"user_likes", 
                                @"publish_stream", 
                                @"friends_about_me", 
                                @"friends_status", 
                                @"friends_website", 
                                @"friends_education_history", 
                                @"friends_work_history", 
                                @"friends_birthday", 
                                @"friends_hometown", 
                                @"friends_location", 
                                @"friends_religion_politics", 
                                nil];
        [appDelegate.facebook authorize:permissions];
    }
}

@end
