//
//  MySlideViewController.h
//  SlideViewController
//
//  Created by Andrew Carter on 12/18/11.

#import "SlideViewController.h"

@interface PASlideViewController : SlideViewController <SlideViewControllerDelegate> {
    
    NSArray *_datasource;
    NSMutableArray *_searchDatasource;
    
}

@property (strong, nonatomic, readonly) NSArray *datasource;

@end
