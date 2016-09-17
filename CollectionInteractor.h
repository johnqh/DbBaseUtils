//
//  CollectionInteractor.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayInteractor.h"

@interface CollectionInteractor : ArrayInteractor

@property (nonatomic, strong) NSObject<InteractiveArray> * collection;

@end
