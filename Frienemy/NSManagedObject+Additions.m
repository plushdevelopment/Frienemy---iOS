//
//  NSManagedObject+JSONImport.m
//  Frienemy
//
//  Created by Ross Chapman on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSManagedObject+Additions.h"

@implementation NSManagedObject (Additions)

+ (id)PA_managedObjectForProperty:(NSString *)propertyName value:(id)propertyValue inContext:(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObject *object;
	if (propertyValue) {
		object = [self MR_findFirstByAttribute:propertyName withValue:propertyValue inContext:managedObjectContext];
		if (!object) {
			object = [self MR_createInContext:managedObjectContext];
			NSDictionary *attributes = [[object entity] attributesByName];
			NSAttributeType attributeType = [[attributes objectForKey:propertyName] attributeType];
			if ((attributeType == NSStringAttributeType) && ([propertyValue isKindOfClass:[NSNumber class]])) {
				propertyValue = [propertyValue stringValue];
			} else if (((attributeType == NSInteger16AttributeType) || (attributeType == NSInteger32AttributeType) || (attributeType == NSInteger64AttributeType) || (attributeType == NSBooleanAttributeType)) && ([propertyValue isKindOfClass:[NSString class]])) {
				propertyValue = [NSNumber numberWithInteger:[propertyValue integerValue]];
			} else if ((attributeType == NSFloatAttributeType) &&  ([propertyValue isKindOfClass:[NSString class]])) {
				propertyValue = [NSNumber numberWithDouble:[propertyValue doubleValue]];
			}
			
			[object setValue:propertyValue forKey:propertyName];
		}
	}
	return object;
}

- (void)PA_setValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter ignoreRelationships:(BOOL)ignore
{
    NSDictionary *attributes = [[self entity] attributesByName];
    for (NSString *attribute in attributes) {
        id value = nil;
        if ([attribute isEqualToString:@"uid"]) {
            value = [keyedValues objectForKey:@"uid"];
			if (!value) {
				value = [keyedValues objectForKey:@"id"];
			}
        } else {
            value = [keyedValues objectForKey:attribute];
        }
        if (value == nil) {
            continue;
        }
        NSAttributeType attributeType = [[attributes objectForKey:attribute] attributeType];
        if ((attributeType == NSStringAttributeType) && ([value isKindOfClass:[NSNumber class]])) {
            value = [value stringValue];
        } else if (((attributeType == NSInteger16AttributeType) || (attributeType == NSInteger32AttributeType) || (attributeType == NSInteger64AttributeType) || (attributeType == NSBooleanAttributeType)) && ([value isKindOfClass:[NSString class]])) {
            value = [NSNumber numberWithInteger:[value integerValue]];
        } else if ((attributeType == NSFloatAttributeType) &&  ([value isKindOfClass:[NSString class]])) {
            value = [NSNumber numberWithDouble:[value doubleValue]];
        } else if ((attributeType == NSDateAttributeType) && ([value isKindOfClass:[NSString class]]) && (dateFormatter != nil)) {
            value = [dateFormatter dateFromString:value];
        }
        if ([value isKindOfClass:[NSNull class]]) {
            continue;
        }
		if (value == nil) {
			continue;
		}
		if (([value isKindOfClass:[NSDictionary class]]) && ([(NSDictionary *)value count] == 0)) {
			continue;
		}
        [self setValue:value forKey:attribute];
    }
    if (!ignore) {
        NSDictionary *relationships = [[self entity] relationshipsByName];
        for (NSString *relationship in [relationships allKeys]) {
            id value = [keyedValues objectForKey:relationship];
            if (value == nil) {
                continue;
            }
            
            NSEntityDescription *entityDesc = [[[[self entity] relationshipsByName] objectForKey:relationship] destinationEntity];
            if (![[relationships objectForKey:relationship] isToMany]) {
                NSManagedObject *object = nil;
                Class aClass = [NSClassFromString([entityDesc name]) class];
                for (NSAttributeDescription *desc in [[aClass MR_entityDescription] attributesByName]) {
                    if ([desc.description isEqualToString:@"uid"]) {
						id relationshipValue = [value valueForKey:@"uid"];
						if (!relationshipValue) {
							relationshipValue = [value valueForKey:@"id"];
						}
                        object = [[NSClassFromString([entityDesc name]) class] PA_managedObjectForProperty:desc.description value:relationshipValue inContext:self.managedObjectContext];
                        break;
                    }
                }
            if (!object)
                    object = [[NSClassFromString([entityDesc name]) class] MR_createInContext:self.managedObjectContext];
                
                if (object) {
                    [object PA_setValuesForKeysWithDictionary:value dateFormatter:dateFormatter ignoreRelationships:YES];
                    [self setValue:object forKey:relationship];
                    continue;
                }
            } else {
                NSMutableSet *relationshipSet = [self mutableSetValueForKey:relationship];
                for (id subValue in value) {
                    NSManagedObject *object = nil;
                    Class aClass = [NSClassFromString([entityDesc name]) class];
                    for (NSAttributeDescription *desc in [[aClass MR_entityDescription] attributesByName]) {
                        if ([desc.description isEqualToString:@"uid"]) {
							id relationshipValue = [subValue valueForKey:@"uid"];
							if (!relationshipValue) {
								relationshipValue = [subValue valueForKey:@"id"];
							}
                            object = [[NSClassFromString([entityDesc name]) class] PA_managedObjectForProperty:desc.description value:relationshipValue inContext:self.managedObjectContext];
                            break;
                        }
                    }
                    //  Not very reuseable but facebook is forcing my hand
                    //  Potential bug here
                    if (!object) {
                        NSString *uid = [[entityDesc userInfo] valueForKey:@"uid"];
                        if (uid) {
                            if ([[entityDesc name] isEqualToString:@"Work"] || [[entityDesc name] isEqualToString:@"Education"]) {
                                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", uid, [subValue valueForKeyPath:uid]];
                                object = [[NSClassFromString([entityDesc name]) class] MR_findFirstWithPredicate:predicate inContext:self.managedObjectContext];
                            }
                        }
                    }
                    
                    if (!object)
                        object = [[NSClassFromString([entityDesc name]) class] MR_createInContext:self.managedObjectContext];
                    
                    if (object) {
                        [object PA_setValuesForKeysWithDictionary:subValue dateFormatter:dateFormatter ignoreRelationships:YES];
                        [relationshipSet addObject:object];
                        continue;
                    }
                }
            }
        }
    }
}

@end
