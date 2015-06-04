//
//  DbWeakReference.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 6/2/15.
//  Copyright (c) 2015 Sudobility. All rights reserved.
//

#import "DbWeakReference.h"

@implementation DbWeakReference

+ (DbWeakReference *)weakReference:(id)obj
{
    return [[DbWeakReference alloc] initWithObject:obj];
}

- (id)initWithObject:(id)obj
{
    if (self = [super init])
    {
        self.obj = obj;
        return self;
    }
    return nil;
}
@end
