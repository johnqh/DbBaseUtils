//
//  CollectionInteractor.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import "CollectionInteractor.h"

@implementation CollectionInteractor

- (void)setCollection:(NSObject<InteractiveArray> *)collection
{
    if (_collection != collection)
    {
        if (_collection)
        {
            [_collection removeObserver:self forKeyPath:@"entries"];
        }
        _collection = collection;
        if (_collection)
        {
            [_collection addObserver:self forKeyPath:@"entries" options:0 context:nil];
        }
        [self refresh];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _collection && [keyPath isEqualToString:@"entries"])
    {
        if ([change[NSKeyValueChangeKindKey] intValue] == NSKeyValueChangeInsertion)
        {
            NSIndexSet * indice = change[NSKeyValueChangeIndexesKey];
            if (indice && indice.count)
            {
                [indice enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    NSObject<InteractiveObject> * entry = self.collection.entries[idx];
                    NSObject<InteractiveObject> * interactor = [self interactorFromEntry:entry];
                    [self.entries insertObject:interactor atIndex:idx];
                }];

            }

        }
        else if ([change[NSKeyValueChangeKindKey] intValue] == NSKeyValueChangeRemoval)
        {
            NSIndexSet * indice = change[NSKeyValueChangeIndexesKey];
            if (indice && indice.count)
            {
                [indice enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [self.entries removeObjectAtIndex:idx];
                }];
            }
        }

    }
}

- (void)refresh
{
    NSMutableArray * entries = [NSMutableArray arrayWithCapacity:self.collection.entries.count];
    for (NSObject<InteractiveObject> * entry in self.collection.entries)
    {
        NSObject<InteractiveObject> * interactor = [self interactorFromEntry:entry];
        [entries addObject:interactor];
    }
    self.entries = entries;
}

@end
