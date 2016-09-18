//
//  InteractiveObject.h
//  DbBaseUtils
//
//  Created by Qiang Huang on 9/4/16.
//  Copyright © 2016 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InteractiveArray;

@protocol InteractiveObject <NSObject>

@optional
@property (nonatomic, readonly) NSString * displayTitle;
@property (nonatomic, readonly) NSString * displaySubtitle;
@property (nonatomic, readonly) NSString * displayImageUrl;
- (NSObject<InteractiveArray> *)children:(NSString *)tag;

@end

@protocol InteractiveArray <InteractiveObject>

@property (nonatomic, strong) NSMutableArray<NSObject<InteractiveObject> *> * entries;

@optional

@property (nonatomic, strong) NSObject<InteractiveObject> * parent;
@property (nonatomic, strong) NSString * title;

@end
