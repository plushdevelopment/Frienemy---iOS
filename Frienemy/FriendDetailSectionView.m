//
//  FriendDetailSectionView.m
//  Frienemy
//
//  Created by Ross Chapman on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailSectionView.h"

@implementation FriendDetailSectionView

@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (id)sectionViewFromNib:(UINib *)nib
{
    NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
    
    NSAssert2(([nibObjects count] > 0) && 
              [[nibObjects objectAtIndex:0] isKindOfClass:[self class]],
              @"Nib '%@' does not appear to contain a valid %@", 
              [self nibName], NSStringFromClass([self class]));
    
    UIView *view = [nibObjects objectAtIndex:0];
    
    return view;  
}

#pragma mark - Nib support

+ (UINib *)nib {
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    return [UINib nibWithNibName:[self nibName] bundle:classBundle];
}

+ (NSString *)nibName
{
    return NSStringFromClass([self class]);
}

@end
