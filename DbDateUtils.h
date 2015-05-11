//
//  DateUtils.h
//  BaseUtils
//
//  Created by John Huang on 11/19/14.
//  Copyright (c) 2014 Sudobility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DbDateUtils : NSObject

+ (NSString *)dateToServer:(NSDate *)date;
+ (NSDate *)dateFromServer:(NSString *)text;

+ (NSString *)datetimeToGmtServer:(NSDate *)date;
+ (NSDate *)datetimeFromGmtServer:(NSString *)text;

+ (NSString *)datetimeToGmtSqliteString:(NSDate *)date;
+ (NSDate *)datetimeFromGmtSqliteString:(NSString *)text;
+ (NSString *)dateToSqliteString:(NSDate *)date;
+ (NSDate *)dateFromSqliteString:(NSString *)text;

+ (NSString *)toString:(NSDate *)date;
+ (NSDate *)fromString:(NSString *)text;
+ (NSString *)toDateString:(NSDate *)date;
+ (NSString *)toUSEnglishString:(NSDate *)date;

+ (NSDate *)addMonth:(int)month toDate:(NSDate *)date;
+ (NSDate *)addDay:(int)day toDate:(NSDate *)date;



@end
