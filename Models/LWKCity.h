//
//  LWKCity.h
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWKNamedObject.h"

#import "LWKWeather.h"
#import "LWKCoordinate.h"
#import "LWKWind.h"

@interface LWKCity : LWKNamedObject
{
    
}

@property (nonatomic, strong) LWKWeather *currentWeather;
@property (nonatomic, strong) LWKCoordinate *coordinate;
@property (nonatomic, strong) LWKWind *wind;


- (void)addForecast:(LWKWeather *)forecast;
- (void)addForecasts:(NSMutableArray <LWKWeather *> *)forecasts;
- (NSDictionary *)getForecast;

@end
