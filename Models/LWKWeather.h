//
//  LWKMain.h
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 1/8/17.
//  Copyright © 2017 Anthony Arzola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWKWeather : NSObject <NSCopying>
{
    
}

@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *icon;


@property (nonatomic, assign) float temperature; //in Kelvin
@property (nonatomic, assign) float minTemperature; //in Kelvin
@property (nonatomic, assign) float maxTemperature; //in Kelvin
@property (nonatomic, assign) float pressure;
@property (nonatomic, assign) float humidity;

-(float)currentTemperatureToFahrenheit;
-(float)currentTemperatureToCelsius;

-(NSString *)currentTemperatureToFahrenheitFormatted;
-(NSString *)currentTemperatureToCelsiusFormatted;

-(float)temperatureToFahrenheit:(float)kelvinTemperature;
-(float)temperatureToCelsius:(float)kelvinTemperature;

@end
