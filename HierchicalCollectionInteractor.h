//
//  HierchicalCollectionInteractor.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 10/1/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import "CollectionInteractor.h"

@interface HierchicalCollectionInteractor : CollectionInteractor

@property (nonatomic, strong) IBInspectable NSString * childrenTag;

@end
