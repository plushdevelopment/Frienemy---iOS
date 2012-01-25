//
//  NSManagedObject+JSONImport.h
//  Frienemy
//
//  Created by Ross Chapman on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Additions)

+ (id)PA_managedObjectForProperty:(NSString *)propertyName value:(id)propertyValue inContext:(NSManagedObjectContext *)managedObjectContext;

- (void)PA_setValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter;

@end
