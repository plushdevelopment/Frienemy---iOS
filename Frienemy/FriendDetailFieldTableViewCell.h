//
//  FriendDetailFieldTableViewCell.h
//  Frienemy
//
//  Created by Ross Chapman on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"

@interface FriendDetailFieldTableViewCell : PRPNibBasedTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *fieldKeyLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldValueLabel;

@end
