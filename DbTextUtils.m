//
//  DbTextUtils.m
//  DbBaseUtils
//
//  Created by John Huang on 5/11/15.
//  Copyright (c) 2015 Sudobility. All rights reserved.
//

#import "DbTextUtils.h"

@implementation DbTextUtils

+ (NSString *)trim:(NSString *)text
{
    if (text)
    {
        NSString * trimmed = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (trimmed && trimmed.length)
        {
            return trimmed;
        }
    }
    return nil;
}

@end
