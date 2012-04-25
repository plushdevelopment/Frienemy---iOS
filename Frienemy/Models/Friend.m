#import "Friend.h"
#import "NSManagedObject+Additions.h"

@implementation Friend

- (void)PA_setValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter
{
    
}

- (void)PA_setValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter ignoreRelationships:(BOOL)ignore
{
    [super PA_setValuesForKeysWithDictionary:keyedValues dateFormatter:dateFormatter ignoreRelationships:ignore];
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

- (NSArray *)sections
{
    NSMutableArray *array = [NSMutableArray array];
    
    return array;
}

- (void)resetStalkerRank
{
    for (StalkerRelationship *relationship in self.stalkingRelationships) {
        [self.managedObjectContext deleteObject:relationship];
    }
}

@end
