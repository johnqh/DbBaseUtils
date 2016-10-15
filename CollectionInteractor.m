//
//  CollectionInteractor.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import "CollectionInteractor.h"

@implementation CollectionInteractor

- (void)setCollection:(NSObject<ModelList> *)collection
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
            [_collection addObserver:self forKeyPath:@"entries" options:NSKeyValueObservingOptionInitial context:nil];
        }
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
                [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indice forKey:@"entries"];
                [indice enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    NSObject<ModelObject> * entry = self.collection.entries[idx];
                    NSObject<ModelObject> * interactor = [self interactorFromEntry:entry];
                    [self.entries insertObject:interactor atIndex:idx];
                }];
                [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indice forKey:@"entries"];

            }

        }
        else if ([change[NSKeyValueChangeKindKey] intValue] == NSKeyValueChangeRemoval)
        {
            NSIndexSet * indice = change[NSKeyValueChangeIndexesKey];
            if (indice && indice.count)
            {
                [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indice forKey:@"entries"];
                [indice enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [self.entries removeObjectAtIndex:idx];
                }];
                [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indice forKey:@"entries"];
            }
        }
        else
        {
            NSMutableArray * entries = [NSMutableArray arrayWithCapacity:self.collection.entries.count];
            for (NSObject<ModelObject> * entry in self.collection.entries)
            {
                NSObject<ModelObject> * interactor = [self interactorFromEntry:entry];
                [entries addObject:interactor];
            }
            self.entries = entries;
        }

    }
}

- (void)dealloc
{
    self.collection = nil;
}

@end
