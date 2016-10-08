//
//  ArrayInteractor.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelObject.h"

@interface ArrayInteractor : NSObject<ModelList>

- (void)refresh;
- (NSObject<ModelObject> *)interactorFromEntry:(NSObject<ModelObject> *)entry;
- (void)sync:(NSArray *)entries;

@end
