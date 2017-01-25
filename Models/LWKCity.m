//
//  LWKCity.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import "LWKCity.h"

@implementation LWKCity
{
    NSMutableArray<LWKWeather *> *_forecast;
}

@synthesize currentWeather;
@synthesize coordinate;
@synthesize wind;

- (id)init
{
    if (self = [super init])
    {
        currentWeather = [LWKWeather new];
        coordinate = [LWKCoordinate new];
        wind = [LWKWind new];
        
        _forecast = [NSMutableArray new];
    }
    return self;
}

#pragma mark - NSCopying Protocol Methods

- (id)copyWithZone:(NSZone *)zone
{
    LWKCity *copy = [[[self class] alloc] init];
    
    copy.currentWeather = [currentWeather copyWithZone:zone];
    copy.coordinate = [coordinate copyWithZone:zone];
    copy.wind = [wind copy];
    
    [copy addForecast: _forecast.copy];
    
    return copy;
}

#pragma mark - Public Methods

- (void)addForecast:(LWKWeather *)forecast
{
    [_forecast addObject:forecast];
}

- (void)addForecasts:(NSMutableArray<LWKWeather *> *)forecasts
{
    [_forecast removeAllObjects];
    
    for (LWKWeather *forecastWeather in forecasts) {
        [self addForecast:forecastWeather];
    }
}

- (NSDictionary *)getForecast
{
    return [_forecast copy];
}

@end
