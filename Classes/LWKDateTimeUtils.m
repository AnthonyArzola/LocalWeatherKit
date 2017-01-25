//
//  LWKDateTimeUtils.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import "LWKDateTimeUtils.h"

@implementation LWKDateTimeUtils

+ (NSString *)getDateTimeWithFormatAndTimeZoneAsString:(NSDate *)date format:(NSString *)format zone:(NSTimeZone *)zone
{
    NSString *strDateOnly = [[NSString alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setTimeZone:zone];
    [dateFormatter setDateFormat:format];
    
    return strDateOnly = [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format
{
    NSLog(@" -- dateFromString: %@", dateString);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return date;
}

+ (NSString *)getDateUsingUserSettingsFormat:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    return [dateFormatter stringFromDate:date];
}

@end
