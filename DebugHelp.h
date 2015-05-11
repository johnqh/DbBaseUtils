//
//  DebugHelp.h
//
//  Created by John Huang on 5/8/14.
//  Copyright (c) 2014 John Huang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DebugHelp : NSObject
{
}

+ (NSMutableArray *)categories;
+ (void)addCategory:(NSString *)category;
+ (bool)shouldLog:(NSString *)category;
+ (void)debugLog:(NSString *)text category:(NSString *)category;

@end

void DebugHelperCategory(NSString * category);
void DebugHelperLog(NSString * category, NSString * text);