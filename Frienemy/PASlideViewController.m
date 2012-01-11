//
//  MySlideViewController.m
//  SlideViewController
//
//  Created by Andrew Carter on 12/18/11.

#import "PASlideViewController.h"

#import "FriendsViewController.h"
#import "SettingsViewController.h"

@implementation PASlideViewController

@synthesize datasource = _datasource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        //creating _searchDatasource for later use!
        _searchDatasource = [NSMutableArray new];
        
        NSMutableArray *datasource = [NSMutableArray array];
        
        /*
        Here's the fun part. What we need to do is creat a datasource array that uses this structure
         
         <Array>
            <Dictionary><!--represents a section in the table-->
                
                <!--This will be displayed as the text in section header. You could also use kSlideViewControllerSectionTitleNoTitle for the value-->
                <key>kSlideViewControllerSectionTitleKey</key>
                <value>My Section Header Text</value>
            
                <!--This will be the rows of that section.-->
                <key>kSlideViewControllerSectionViewControllersKey</key>
                <value>
                    <Array>
         
                        <Dictionary>
         
                            <!--this will be the title for the row-->
                            <key>kSlideViewControllerViewControllerTitleKey</key>
                            <value>My Text</value>
         
                            <!--This is the view controller class that should be created / displayed when this row is clicked-->
                            <key>kSlideViewControllerViewControllerClassKey</key>
                            <value>[MyViewControllerSubclass class]</value>
                            
                            <!--If you're using nibs, include the nib name in this key-->
                            <key>kSlideViewControllerViewControllerNibNameKey</key>
                            <value>MyViewControllerSubclass</value>
                            
                            <!--Include a UIImage with this key to have an icon for the row -->
                            <key>kSlideViewControllerViewControllerIconKey</key>
                            <value>*UIImage*</value>
         
                            <!--This gets passed along with the configureViewController:userInfo: method if you implement it-->
                            <key>kSlideViewControllerViewControllerUserInfoKey</key>
                            <value>anything you want</value>
         
                        </Dictionary>
         
                    </Array>
                </value>
         
            </Dictionary><!--end table section-->
         </Array>
        
         
         */
        NSMutableDictionary *sectionOne = [NSMutableDictionary dictionary];
        [sectionOne setObject:kSlideViewControllerSectionTitleNoTitle forKey:kSlideViewControllerSectionTitleKey];
        
        NSMutableDictionary *homeViewControllerDictionary = [NSMutableDictionary dictionary];
        [homeViewControllerDictionary setObject:@"Friends" forKey:kSlideViewControllerViewControllerTitleKey];
        [homeViewControllerDictionary setObject:@"FriendsViewController" forKey:kSlideViewControllerViewControllerNibNameKey];
        [homeViewControllerDictionary setObject:[FriendsViewController class] forKey:kSlideViewControllerViewControllerClassKey];
        
        [sectionOne setObject:[NSArray arrayWithObject:homeViewControllerDictionary] forKey:kSlideViewControllerSectionViewControllersKey];
        
        [datasource addObject:sectionOne];
        
        NSMutableDictionary *sectionThree = [NSMutableDictionary dictionary];
        [sectionThree setObject:@"" forKey:kSlideViewControllerSectionTitleKey];
        
        NSMutableDictionary *settingsViewControllerDictionary = [NSMutableDictionary  dictionary];
        [settingsViewControllerDictionary setObject:@"Settings" forKey:kSlideViewControllerViewControllerTitleKey];
        [settingsViewControllerDictionary setObject:[SettingsViewController class] forKey:kSlideViewControllerViewControllerClassKey];
        
        [sectionThree setObject:[NSArray arrayWithObject:settingsViewControllerDictionary] forKey:kSlideViewControllerSectionViewControllersKey];
        
        [datasource addObject:sectionThree];
        
        _datasource = datasource;
        
    }
    
    return self;
}


- (UIViewController *)initialViewController
{
    FriendsViewController *friendsViewController = [[FriendsViewController alloc] initWithNibName:@"FriendsViewController" bundle:nil];
    
    return friendsViewController;
    
}

- (NSIndexPath *)initialSelectedIndexPath {
    
    return [NSIndexPath indexPathForRow:0 inSection:0];
    
}

- (void)configureViewController:(UIViewController *)viewController userInfo:(id)userInfo {
    
    
    
}

- (void)configureSearchDatasourceWithString:(NSString *)string {

    NSArray *searchableControllers = [[[self datasource] objectAtIndex:1] objectForKey:kSlideViewControllerSectionViewControllersKey];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"slideViewControllerViewControllerTitle CONTAINS[cd] %@", string];
    [_searchDatasource setArray:[searchableControllers filteredArrayUsingPredicate:predicate]];
    
}

- (NSArray *)searchDatasource  {
    
    return _searchDatasource;
}


@end
