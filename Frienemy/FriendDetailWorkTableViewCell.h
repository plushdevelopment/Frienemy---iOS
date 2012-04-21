//
//  FriendDetailWorkTableViewCell.h
//  Frienemy
//
//  Created by Ross Chapman on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"

@interface FriendDetailWorkTableViewCell : PRPNibBasedTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *employerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *workDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UIImageView *yearImageView;

- (void)configureCellForWork:(Work *)work;

@end
