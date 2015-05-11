//
//  DebugHelp.m
//
//  Created by John Huang on 5/8/14.
//  Copyright (c) 2014 John Huang. All rights reserved.
//

#import "DebugHelp.h"

static NSMutableArray * categories;

@implementation DebugHelp

+ (NSMutableArray *)categories
{
	if (!categories)
	{
		categories = [[NSMutableArray alloc] init];
	}
	return categories;
}

+ (void)addCategory:(NSString *)category
{
	NSMutableArray * categories = [DebugHelp categories];
	[categories addObject:category];
}

+ (bool)shouldLog:(NSString *)category
{
	bool found = false;
	NSMutableArray * categories = [DebugHelp categories];
	for (int i = 0; !found && i < [categories count]; i ++)
	{
		NSString * existing = (NSString *)[categories objectAtIndex:i];
		if ([existing isEqualToString:category])
		{
			found = true;
		}
	}
	return found;
}

+ (void)debugLog:(NSString *)text category:(NSString *)category
{
	if ([DebugHelp shouldLog:category])
	{
		NSLog(@"%@", text);
	}
}

@end

void DebugHelperCategory(NSString * category)
{
	[DebugHelp addCategory:category];
}

void DebugHelperLog(NSString * category, NSString * text)
{
	[DebugHelp debugLog:text category:category];
}
