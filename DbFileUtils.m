//
//  FileUtils.m
//  DbBridge
//
//  Created by John Huang on 3/19/14.
//  Copyright (c) 2014 John Huang. All rights reserved.
//

#import "DbFileUtils.h"
#import <sys/xattr.h>

@implementation DbFileUtils

+ (bool)fileExists:(NSString *)path
{
	BOOL isDir = NO;
	return [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
	
}

+ (void)deleteFile:(NSString *)path
{
	NSError * error = nil;
	[[NSFileManager defaultManager] removeItemAtPath:path error:&error];
}


+ (bool)copyFile:(NSString *)toPath from:(NSString *)fromPath
{
    if ([self fileExists:fromPath] && ![self fileExists:toPath])
    {
        return [[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:toPath error:nil];
    }
    return false;
}

+ (bool)moveFile:(NSString *)toPath from:(NSString *)fromPath
{
    if ([self fileExists:fromPath] && ![self fileExists:toPath])
    {
        return [[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:toPath error:nil];
    }
    return false;
    
}
@end
