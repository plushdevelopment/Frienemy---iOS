//
//  NSString+NSString_Encode.m
//  Frienemy
//
//  Created by Ross Chapman on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Encode.h"

@implementation NSString (Encode)

- (NSString *)urlencode
{
    NSArray *escapeChars = [NSArray arrayWithObjects:@";",
							@"@",
                            @"$",
							@"[",
							@"]",
                            @"#",
							@"!",
							@"*",
							@" ",
							@"{",
							@"}",
							@"\"", nil];
    
    NSArray *replaceChars = [NSArray arrayWithObjects:@"%3B",
							 @"%40",
							 @"%24",
							 @"%5B",
							 @"%5D", 
                             @"%23",
							 @"%21",
							 @"%2A",
							 @"%20",
							 @"%7B",
							 @"%7D",
							 @"%22", nil];
    
    int len = [escapeChars count];
    
    NSMutableString *temp = [self mutableCopy];
    
    int i;
    for(i = 0; i < len; i++)
    {
        
        [temp replaceOccurrencesOfString: [escapeChars objectAtIndex:i]
                              withString:[replaceChars objectAtIndex:i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
    
    NSString *out = [NSString stringWithString: temp];
    
    return out;
}

@end
