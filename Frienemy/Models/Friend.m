#import "Friend.h"
#import "NSManagedObject+Additions.h"

@implementation Friend

- (void)PA_setValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter
{
    [super PA_setValuesForKeysWithDictionary:keyedValues dateFormatter:dateFormatter];
    self.section = [self.name substringToIndex:1];

}

- (NSString *)downloadPath
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *iconPath = [documentsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg", self.uid]];
    return iconPath;
}

- (NSString *)normalDownloadPath
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *iconPath = [documentsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-normal.jpg", self.uid]];
    return iconPath;
}

@end
