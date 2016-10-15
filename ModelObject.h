//
//  ModelObject.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelList;

@protocol ModelObject <NSObject>

@optional
@property (nonatomic, readonly) NSString * displayTitle;
@property (nonatomic, readonly) NSString * displaySubtitle;
@property (nonatomic, readonly) NSString * displayImageUrl;
- (NSObject<ModelList> *)children:(NSString *)tag;

@end

@protocol ModelList <ModelObject>

@property (nonatomic, strong) NSMutableArray<NSObject<ModelObject> *> * entries;

- (void)refresh;

@optional

@property (nonatomic, strong) NSObject<ModelObject> * parent;

@end
