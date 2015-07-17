//
//  DateUtils.m
//  BaseUtils
//
//  Created by John Huang on 11/19/14.
//  Copyright (c) 2014 Sudobility. All rights reserved.
//

#import "DbDateUtils.h"

static NSDateFormatter * _dateFormatter = nil;

@implementation DbDateUtils

+ (NSDateFormatter *)gmtFormatter
{
    if (!_dateFormatter)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en-US"]];
        NSTimeZone * gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        [_dateFormatter setTimeZone:gmt];
    }
    _dateFormatter.dateFormat = nil;
    _dateFormatter.dateStyle = kCFDateFormatterNoStyle;
    _dateFormatter.timeStyle = kCFDateFormatterNoStyle;
    return _dateFormatter;
}

+ (NSDateFormatter *)localFormatter
{
    if (!_dateFormatter)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en-US"]];
        NSTimeZone * gmt = [NSTimeZone localTimeZone];
        [_dateFormatter setTimeZone:gmt];
    }
    _dateFormatter.dateFormat = nil;
    _dateFormatter.dateStyle = kCFDateFormatterNoStyle;
    _dateFormatter.timeStyle = kCFDateFormatterNoStyle;
    return _dateFormatter;
}

+ (NSString *)dateToServer:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateFormat:@"M/d/y"];
        return [formatter stringFromDate:date];
    }
    return nil;
}

+ (NSDate *)dateFromServer:(NSString *)text
{
    if (text)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateFormat:@"M/d/y"];
        NSDate * date = [formatter dateFromString:text];
        if (date)
        {
            return date;
        }
    }
    return nil;
}

+ (NSString *)datetimeToGmtServer:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self gmtFormatter];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        return [formatter stringFromDate:date];
    }
    return nil;
}

+ (NSDate *)datetimeFromGmtServer:(NSString *)text
{
    if (text)
    {
        NSDateFormatter * formatter = [self gmtFormatter];
        [formatter setDateFormat:@"MM/dd/yyyy H:mm:ss"];
        //	[formatter setDateStyle:NSDateFormatterShortStyle];
        //	[formatter setTimeStyle:NSDateFormatterShortStyle];
        NSDate * date = [formatter dateFromString:text];
        if (date == nil)
        {
            [formatter setDateFormat:@"MM/dd/yyyy h:mm:ss a"];
            date = [formatter dateFromString:text];
        }
        if (date)
        {
            return date;
        }
    }
    return nil;
}

+ (NSString *)datetimeToGmtSqliteString:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self gmtFormatter];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString * dateText = [formatter stringFromDate:date];
        return dateText;
    }
    return nil;
}

+ (NSDate *)datetimeFromGmtSqliteString:(NSString *)text
{
    if (text)
    {
        NSDateFormatter * formatter = [self gmtFormatter];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate * date = [formatter dateFromString:text];
        if (date)
        {
            return date;
        }
    }
    return nil;
}

+ (NSString *)dateToSqliteString:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        return [formatter stringFromDate:date];
    }
    return nil;
}

+ (NSDate *)dateFromSqliteString:(NSString *)text
{
    if (text)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        return [formatter dateFromString:text];
    }
    return nil;
}

+ (NSString *)toString:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        return [formatter stringFromDate:date];
    }
    return nil;
}

+ (NSString *)toDateString:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        return [formatter stringFromDate:date];
    }
    return nil;
}

+ (NSDate *)fromString:(NSString *)text
{
    if (text)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        return [formatter dateFromString:text];
    }
    return nil;
}

+ (NSString *)toUSEnglishString:(NSDate *)date
{
    if (date)
    {
        NSDateFormatter * formatter = [self localFormatter];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        return [formatter stringFromDate:date];
    }
    return nil;
}

+ (NSDate *)addMonth:(int)month toDate:(NSDate *)date;
{
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents * components = [[NSDateComponents alloc] init];
    components.month = month;
    return [gregorian dateByAddingComponents:components toDate:date options:0];
}

+ (NSDate *)addDay:(int)day toDate:(NSDate *)date;
{
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents * components = [[NSDateComponents alloc] init];
    components.day = day;
    return [gregorian dateByAddingComponents:components toDate:date options:0];
}
@end
