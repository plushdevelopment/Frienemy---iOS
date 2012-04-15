//
//  FriendDetailEducationTableViewCell.m
//  Frienemy
//
//  Created by Ross Chapman on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailEducationTableViewCell.h"

@implementation FriendDetailEducationTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize studyLabel = _studyLabel;
@synthesize yearLabel = _yearLabel;
@synthesize yearImageView = _yearImageView;

- (void)configureCellForEducation:(Education *)education
{
    self.nameLabel.text = education.school.name;
    NSMutableString *concentrationString = [NSMutableString string];
    BOOL firstConcentration = YES;
    for (Concentration *concentration in education.concentration) {
        if (!firstConcentration)
            [concentrationString appendString:@", "];
        [concentrationString appendString:concentration.name];
        firstConcentration = NO;
    }
    self.studyLabel.text = concentrationString;
    if (education.year) {
        self.yearLabel.text = education.year.name;
        self.yearImageView.hidden = NO;
    } else {
        self.yearLabel.text = @"";
        self.yearImageView.hidden = YES;
    }
}

@end
