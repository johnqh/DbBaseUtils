//
//  ArrayInteractor.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import "ArrayInteractor.h"

@implementation ArrayInteractor

@synthesize entries = _entries;

- (NSObject<InteractiveObject> *)interactorFromEntry:(NSObject<InteractiveObject> *)entry
{
    return entry;   // default to object directly
}

- (NSInteger)indexOf:(NSObject<InteractiveObject> *)sourceObject in:(NSArray *)destination startingAtIndex:(NSInteger)startIndex
{
    NSInteger foundIndex = NSNotFound;
    for (NSInteger i = startIndex; (foundIndex == NSNotFound) && (i < destination.count); i ++)
    {
        NSObject<InteractiveObject> * existingObject = destination[i];
        BOOL same = [self compare:existingObject with:sourceObject];
        if (same)
        {
            foundIndex = i;
        }
    }
    return foundIndex;
}

- (bool)compare:(NSObject<InteractiveObject> *)destination with:(NSObject<InteractiveObject> *)source
{
    return (destination == source);
}

- (void)sync:(NSArray *)entries
{
    if (_entries)
    {
        NSObject<InteractiveObject> * lastItem = nil;
        NSInteger cursor = 0;
        for (NSUInteger i = 0; i < entries.count; i ++)
        {
            NSObject<InteractiveObject> * existingItem = nil;
            NSObject<InteractiveObject> * sourceObject = entries[i];
            NSUInteger foundIndex = [self indexOf:sourceObject in:_entries startingAtIndex:cursor];
            if (foundIndex != NSNotFound)
            {
                // first, we want to remove all the existing ones between cursor and the index
                for (NSUInteger j = cursor; j < foundIndex; j ++)
                {
                    NSIndexSet * loneIndex = [NSIndexSet indexSetWithIndex:cursor];

                    // key change must match property. Do not use const
                    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:loneIndex forKey:@"entries"];
                    [_entries removeObjectAtIndex:cursor];
                    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:loneIndex forKey:@"entries"];
                }
                existingItem = entries[cursor];
            }
            else
            {
                NSIndexSet * loneIndex = [NSIndexSet indexSetWithIndex:cursor];

                // key change must match property. Do not use const
                [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:loneIndex forKey:@"entries"];
                [_entries insertObject:sourceObject atIndex:cursor];
                [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:loneIndex forKey:@"entries"];
            }
            lastItem = existingItem;
            cursor ++;
        }
        // Once we have reached the end, remove whatever left-over in the existing list
        NSUInteger extras = _entries.count - cursor;
        for (NSUInteger i = 0; i < extras; i ++)
        {
            NSIndexSet * loneIndex = [NSIndexSet indexSetWithIndex:cursor];

            // key change must match property. Do not use const
            [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:loneIndex forKey:@"entries"];
            [_entries removeObjectAtIndex:cursor];
            [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:loneIndex forKey:@"entries"];
        }
    }
    else
    {
        self.entries = [NSMutableArray arrayWithArray:entries];
    }
}

@end
