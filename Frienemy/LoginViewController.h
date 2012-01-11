//
//  LoginViewController.h
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

- (IBAction)facebookLogin:(id)sender;

@end
