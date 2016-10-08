//
//  ObjectInteractor.m
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import "ObjectInteractor.h"

@implementation ObjectInteractor

- (NSString *)displayTitle
{
    return _data.displayTitle;
}

- (NSString *)displaySubtitle
{
    return _data.displaySubtitle;
}

- (NSString *)displayImageUrl
{
    return _data.displayImageUrl;
}

- (NSObject<ModelList> *)children:(NSString *)tag
{
    return [_data children:tag];
}

@end
