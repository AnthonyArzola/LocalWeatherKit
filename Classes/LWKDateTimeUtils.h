//
//  LWKDateTimeUtils.h
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWKDateTimeUtils : NSObject

+ (NSString *)getDateTimeWithFormatAndTimeZoneAsString:(NSDate *)date format:(NSString *)format zone:(NSTimeZone *)zone;

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format;

+ (NSString *)getDateUsingUserSettingsFormat:(NSDate *)date;

@end
