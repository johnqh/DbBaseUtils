//
//  FileUtils.h
//  DbBridge
//
//  Created by John Huang on 3/19/14.
//  Copyright (c) 2014 John Huang. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface DbFileUtils : NSObject {
    
}

+ (bool)fileExists:(NSString *)path;
+ (void)deleteFile:(NSString *)path;
+ (bool)copyFile:(NSString *)toPath from:(NSString *)fromPath;
+ (bool)copyFile:(NSString *)toPath from:(NSString *)fromPath forced:(bool)forced;
+ (bool)moveFile:(NSString *)toPath from:(NSString *)fromPath;

@end
