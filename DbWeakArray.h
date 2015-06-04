//
//  DbWeakArray.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 6/2/15.
//  Copyright (c) 2015 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DbWeakArray : NSMutableArray

+ (instancetype)array;
- (void)compact;

@end
