#import "Friend.h"
#import "NSManagedObject+Additions.h"

@implementation Friend

- (void)PA_setValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter
{
    [super PA_setValuesForKeysWithDictionary:keyedValues dateFormatter:dateFormatter];
    self.section = [self.name substringToIndex:1];

}

@end
