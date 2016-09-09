//
//  DbWeakArray.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 6/2/15.
//  Copyright (c) 2015 Sudobility. All rights reserved.
//

#import "DbWeakArray.h"

@interface DbWeakArray()
{
    NSPointerArray * _array;
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
        _array = [NSPointerArray weakObjectsPointerArray];
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
    [_array insertPointer:(__bridge void *)anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [_array removePointerAtIndex:index];
}

- (void)addObject:(id)anObject
{
    [_array addPointer:(__bridge void *)anObject];
}

- (void)removeLastObject
{
    [self removeObjectAtIndex:self.count - 1];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [_array replacePointerAtIndex:index withPointer:(__bridge void *)anObject];
}

- (NSUInteger)count
{
    return [_array count];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return (__bridge id)[_array pointerAtIndex:index];
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
