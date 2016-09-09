//
//  InteractiveObject.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InteractiveObject <NSObject>

@end

@protocol InteractiveArray <NSObject>

@property (nonatomic, strong) NSMutableArray * entries;

@end
