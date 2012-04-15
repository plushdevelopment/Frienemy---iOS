//
//  FriendDetailEducationTableViewCell.h
//  Frienemy
//
//  Created by Ross Chapman on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"

@interface FriendDetailEducationTableViewCell : PRPNibBasedTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *studyLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UIImageView *yearImageView;

- (void)configureCellForEducation:(Education *)education;

@end
