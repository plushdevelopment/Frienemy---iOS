//
//  FriendDetailSectionView.h
//  Frienemy
//
//  Created by Ross Chapman on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailSectionView : UIView

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

+ (UINib *)nib;
+ (NSString *)nibName;

+ (id)sectionViewFromNib:(UINib *)nib;

@end
