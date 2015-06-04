//
//  DbWeakArray.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 6/2/15.
//  Copyright (c) 2015 Sudobility. All rights reserved.
//

#import "DbWeakArray.h"
#import "DbWeakReference.h"

@interface DbWeakArray()
{
    NSMutableArray * _array;
}

@end

@implementation DbWeakArray

+ (instancetype)array
{
    return [[DbWeakArray alloc] init];
}

- (id)init
{
    if (self = [super init])
    {
        _array = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (void)compact
{
    for (NSInteger i = self.count - 1; i >= 0; i --)
    {
        id obj = [self objectAtIndex:i];
        if (!obj)
        {
            [self removeObjectAtIndex:i];
        }
    }
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    [_array insertObject:[DbWeakReference weakReference:anObject] atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [_array removeObjectAtIndex:index];
}

- (void)addObject:(id)anObject
{
    [_array addObject:[DbWeakReference weakReference:anObject]];
}

- (void)removeLastObject
{
    [_array removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [_array replaceObjectAtIndex:index withObject:[DbWeakReference weakReference:anObject]];
}

- (NSUInteger)count
{
    return [_array count];
}

- (id)objectAtIndex:(NSUInteger)index
{
    DbWeakReference * reference = [_array objectAtIndex:index];
    return reference.obj;
}

- (NSUInteger)indexOfObject:(id)anObject
{
    NSUInteger found = NSNotFound;
    for (NSInteger i = 0; found == NSNotFound && i < self.count; i ++)
    {
        if ([self objectAtIndex:i] == anObject)
        {
            found = i;
        }
    }
    return found;
}


@end
