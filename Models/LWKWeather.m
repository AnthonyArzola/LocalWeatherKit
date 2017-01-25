//
//  LWKMain.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 1/8/17.
//  Copyright © 2017 Anthony Arzola. All rights reserved.
//

#import "LWKWeather.h"
#import "LWKConstants.h"

@implementation LWKWeather

@synthesize shortDescription;
@synthesize description;
@synthesize icon;

@synthesize temperature;
@synthesize minTemperature;
@synthesize maxTemperature;
@synthesize pressure;
@synthesize humidity;

- (id)init
{
    if (self = [super init])
    {
        temperature = 0.0;
        minTemperature = 0.0;
        maxTemperature = 0.0;
        pressure = 0.0;
        humidity = 0.0;
    }
    
    return self;
}

#pragma mark - NSCopying Protocol Methods

- (id)copyWithZone:(NSZone *)zone
{
    LWKWeather *copy = [[self class] new];
    
    copy.shortDescription = [shortDescription copyWithZone:zone];
    copy.description = [description copyWithZone:zone];
    copy.icon = [description copyWithZone:zone];
    
    copy.temperature = temperature;
    copy.minTemperature = minTemperature;
    copy.maxTemperature = maxTemperature;
    copy.pressure = pressure;
    copy.humidity = humidity;
    
    return copy;
}

#pragma mark - Public Methods

- (float)currentTemperatureToFahrenheit
{
    return [self temperatureToFahrenheit:self.temperature];
}

- (float)currentTemperatureToCelsius
{
    return [self temperatureToFahrenheit:self.temperature];
}


- (NSString *)currentTemperatureToFahrenheitFormatted
{
    return [NSString stringWithFormat:@"%.1f%@F", [self currentTemperatureToFahrenheit], @"\u00B0"];
}

- (NSString *)currentTemperatureToCelsiusFormatted
{
    return [NSString stringWithFormat:@"%.1f%@F", [self currentTemperatureToCelsius], @"\u00B0"];
}


- (float)temperatureToFahrenheit:(float)kelvinTemperature
{
    if(kelvinTemperature > 0)
        return (kelvinTemperature * (9.0/5.0)) - KELVIN_FAHRENHEIT_DELTA;
    else
        return 0.0;
}

- (float)temperatureToCelsius:(float)kelvinTemperature;
{
    if(kelvinTemperature > 0)
        return kelvinTemperature - KELVIN_CELSIUS_DELTA;
    else
        return 0.0;
}


@end
