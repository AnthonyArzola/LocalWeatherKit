//
//  LWKManager.h
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 11/12/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWKManager : NSObject

+(LWKManager *)sharedInstance;

/*!
 @abstract Get current weather by City ID
 @param cityId ID that uniquely identifiers a city
 @param apiKey OpenWeather API key
 @param success Successful completion block
 @param failure Failure completion block
 */
-(void)getCurrentWeatherByCityId:(NSInteger)cityId
                          apiKey:(NSString *)apiKey
                     withSuccess:(void (^)(id responseObject))success
                     withFailure:(void (^)(NSError *error))failure;

/*!
 @abstract Get 5-Day forcast
 @param cityId ID that uniquely identifies a city
 @param apiKey OpenWeather API key
 @param success Successful completion block
 @param failure Failure completion block
 */
-(void)get5DayForecastByCityId:(NSInteger)cityId
                        apiKey:(NSString *)apiKey
                   withSuccess:(void (^)(id responseObject))success
                   withFailure:(void (^)(NSError *error))failure;

/*!
 @abstract Get weather at specified coordinate
 @param latitude Latitude coordinate
 @param longitude Longitude coordinate
 @param apiKey OpenWeather API key
 @param success Successful completion block
 @param failure Failure completion block
 */
-(void)getCurrentWeatherByCoordinatesWithLatitude:(float)latitude
                                        longitude:(float)longitude
                                           apiKey:(NSString *)apiKey
                                      withSuccess:(void (^)(id responseObject))success
                                      withFailure:(void (^)(NSError *error))failure;

/*!
 @abstract Get weather for N cities at specified coordinate
 @param latitude Point north or south of the celestial equator
 @param longitude Point east or west of the meridian
 @param expectedCityCount Expected number of city-weather data to return around specified coordinate. Minimum 10, maximum is 50.
 @param apiKey OpenWeather API key
 @param success Successful completion block
 @param failure Failure completion block
 */
-(void)getCurrentWeatherByCoordinatesWithLatitude:(float)latitude
                                        longitude:(float)longitude
                                expectedCityCount:(NSInteger)expectedCityCount
                                           apiKey:(NSString *)apiKey
                                      withSuccess:(void (^)(id responseObject))success
                                      withFailure:(void (^)(NSError *error))failure;

@end
