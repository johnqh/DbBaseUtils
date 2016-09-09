//
//  ObjectInteractor.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InteractiveObject.h"

@interface ObjectInteractor : NSObject<InteractiveObject>

@property (nonatomic, strong) NSObject<InteractiveObject> * data;

@end
