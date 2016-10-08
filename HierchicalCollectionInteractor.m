//
//  HierchicalCollectionInteractor.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 10/1/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import "HierchicalCollectionInteractor.h"

@implementation HierchicalCollectionInteractor

@synthesize parent = _parent;

- (NSString *)displayTitle
{
    return self.parent.displayTitle;
}

- (void)setParent:(NSObject<ModelObject> *)parent
{
    if (_parent != parent)
    {
        _parent = parent;
        [self refresh];
    }
}

- (void)refresh
{
    self.collection = [self.parent children:_childrenTag];
}

- (void)dealloc
{
    self.parent = nil;
}

@end
