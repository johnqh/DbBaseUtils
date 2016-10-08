//
//  ObjectInteractor.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelObject.h"

@interface ObjectInteractor : NSObject<ModelObject>

@property (nonatomic, strong) NSObject<ModelObject> * data;

@end
