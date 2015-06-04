//
//  DbWeakReference.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 6/2/15.
//  Copyright (c) 2015 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DbWeakReference : NSObject

@property (nonatomic, weak) id obj;

+ (DbWeakReference *)weakReference:(id)obj;

- (id)initWithObject:(id)obj;

@end
