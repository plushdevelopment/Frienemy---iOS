//
//  PAAppDelegate.h
//  Frienemy
//
//  Created by Ross Chapman on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "ASIHTTPRequestDelegate.h"

@interface PAAppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate, ASIHTTPRequestDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Facebook *facebook;

- (void)customizeNavigation;
- (void)initializeFacebook;

@end
