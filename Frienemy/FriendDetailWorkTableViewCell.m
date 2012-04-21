//
//  FriendDetailWorkTableViewCell.m
//  Frienemy
//
//  Created by Ross Chapman on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailWorkTableViewCell.h"

@implementation FriendDetailWorkTableViewCell

@synthesize employerNameLabel = _employerNameLabel;
@synthesize workDescriptionLabel = _workDescriptionLabel;
@synthesize positionLabel = _positionLabel;
@synthesize yearLabel = _yearLabel;
@synthesize yearImageView = _yearImageView;

- (void)configureCellForWork:(Work *)work
{
    self.employerNameLabel.text = work.employer.name;
    NSMutableString *yearString = [NSMutableString string];
    if (work.start_date) {
        [yearString appendString:work.start_date];
    }
    if (work.start_date && work.end_date) {
        [yearString appendString:@" - "];
    }
    if (work.end_date) {
        [yearString appendString:work.end_date];
    }
    if (yearString.length) {
        self.yearLabel.text = yearString;
        self.yearImageView.hidden = NO;
    } else {
        self.yearLabel.text = @"";
        self.yearImageView.hidden = YES;
    }
    self.workDescriptionLabel.text = work.work_description;
    self.positionLabel.text = work.position.name;
}

@end
