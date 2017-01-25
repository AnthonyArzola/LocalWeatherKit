//
//  LWKManager.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 11/12/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import "LWKManager.h"
#import "LWKConstants.h"

#import "LWKCity.h"
#import "LWKCities.h"

#import "AFNetworking.h"
#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"
#import "DCArrayMapping.h"

static LWKManager * _sharedInstance = nil;
static AFHTTPSessionManager * _sharedAfHttpSessionManager = nil;

@implementation LWKManager

-(id)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

+(LWKManager *)sharedInstance
{
    if (!_sharedInstance)
    {
        _sharedInstance = [LWKManager new];
        
        // Configure AFNetworking HTTP Session Manager        
        _sharedAfHttpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _sharedAfHttpSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return _sharedInstance;
}

#pragma mark - Public Methods


-(void)getCurrentWeatherByCityId:(NSInteger)cityId
                          apiKey:(NSString *)apiKey
                     withSuccess:(void (^)(id responseObject))success
                     withFailure:(void (^)(NSError *error))failure
{
    // API Example: http://api.openweathermap.org/data/2.5/weather?id=5344994&APPID={YOUR_APIKEY}
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:[NSDecimalNumber numberWithInteger:cityId] forKey:PARAMETER_CITY_ID];
    [parameters setObject:apiKey forKey:PARAMETER_APP_ID];
    
    [_sharedAfHttpSessionManager GET:API_PATH_WEATHER_BY_CITY_ID
                          parameters:parameters
                            progress:nil
                             success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                                 
                                 DCParserConfiguration *parseConfig = [DCParserConfiguration configuration];
                                 
                                 // Custom mappings
                                 [parseConfig addObjectMapping:[DCObjectMapping mapKeyPath:@"id" toAttribute:@"identifier" onClass:[LWKCity class]]];
                                 [parseConfig addObjectMapping:[DCObjectMapping mapKeyPath:@"deg" toAttribute:@"degrees" onClass:[LWKWind class]]];
                                 
                                 [parseConfig addObjectMappings:[self generateTemperatureObjectMappings]];
                                 [parseConfig addObjectMappings:[self generateCoordinateObjectMappings]];
                                 
                                 DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[LWKCity class] andConfiguration:parseConfig];
                                 LWKCity *city = [parser parseDictionary:responseObject];
                                 
                                 // Unfortunately, API exposes weather descriptions and icon name in dictionary within single cell array
                                 if (city && [responseObject objectForKey:@"weather"])
                                 {
                                     NSArray *weatherArray = [responseObject objectForKey:@"weather"];
                                     
                                     if (weatherArray && weatherArray.count > 0)
                                     {
                                         NSDictionary *weatherDictionary = [weatherArray objectAtIndex:0];
                                         city.currentWeather.shortDescription = [weatherDictionary objectForKey:@"main"];
                                         city.currentWeather.description = [weatherDictionary objectForKey:@"description"];
                                         city.currentWeather.icon = [weatherDictionary objectForKey:@"icon"];
                                     }
                                 }
                                 
                                 success(city);
                                 
                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                 
                                 failure(error);
                             }
     ];
}

-(void)get5DayForecastByCityId:(NSInteger)cityId
                        apiKey:(NSString *)apiKey
                   withSuccess:(void (^)(id responseObject))success
                   withFailure:(void (^)(NSError *error))failure
{
    // API Example: http://api.openweathermap.org/data/2.5/forecast/city?id=5344994&APPID={YOUR_APIKEY}
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:[NSDecimalNumber numberWithInteger:cityId] forKey:PARAMETER_CITY_ID];
    [parameters setObject:apiKey forKey:PARAMETER_APP_ID];
    
    [_sharedAfHttpSessionManager GET:API_PATH_FORECAST_BY_CITY_ID
                          parameters:parameters
                            progress:nil
                             success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                                 
                                     success(responseObject);
                                 
                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                 
                                 failure(error);
                             }
     ];
}

-(void)getCurrentWeatherByCoordinatesWithLatitude:(float)latitude
                                        longitude:(float)longitude
                                           apiKey:(NSString *)apiKey
                                      withSuccess:(void (^)(id responseObject))success
                                      withFailure:(void (^)(NSError *error))failure
{
    // API Example: http://api.openweathermap.org/data/2.5/weather?lat=34.02&lon=-118.17&APPID={YOUR_APIKEY}

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:[NSDecimalNumber numberWithFloat:latitude] forKey:PARAMETER_LATITUDE];
    [parameters setObject:[NSDecimalNumber numberWithFloat:longitude] forKey:PARAMETER_LONGITUDE];
    [parameters setObject:apiKey forKey:PARAMETER_APP_ID];
    
    [_sharedAfHttpSessionManager GET:API_PATH_WEATHER_AT_COORDIANTES
                          parameters:parameters
                            progress:nil
                             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                 
                                 DCParserConfiguration *parseConfig = [DCParserConfiguration configuration];
                                 
                                 // Custom mappings
                                 [parseConfig addObjectMapping:[DCObjectMapping mapKeyPath:@"id" toAttribute:@"identifier" onClass:[LWKCity class]]];
                                 [parseConfig addObjectMapping:[DCObjectMapping mapKeyPath:@"deg" toAttribute:@"degrees" onClass:[LWKWind class]]];
                                 
                                 [parseConfig addObjectMappings:[self generateTemperatureObjectMappings]];
                                 [parseConfig addObjectMappings:[self generateCoordinateObjectMappings]];
                                 
                                 DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[LWKCity class] andConfiguration:parseConfig];
                                 LWKCity *city = [parser parseDictionary:responseObject];
                                 
                                 // Unfortunately, API exposes weather descriptions and icon name in dictionary within single cell array
                                 if (city && [responseObject objectForKey:@"weather"])
                                 {
                                     NSArray *weatherArray = [responseObject objectForKey:@"weather"];
                                     
                                     if (weatherArray && weatherArray.count > 0)
                                     {
                                         NSDictionary *weatherDictionary = [weatherArray objectAtIndex:0];
                                         city.currentWeather.shortDescription = [weatherDictionary objectForKey:@"main"];
                                         city.currentWeather.description = [weatherDictionary objectForKey:@"description"];
                                         city.currentWeather.icon = [weatherDictionary objectForKey:@"icon"];
                                     }
                                 }
                                 
                                 success(city);
                                 
                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                 
                                 failure(error);
                                 
                             }
     ];
}

-(void)getCurrentWeatherByCoordinatesWithLatitude:(float)latitude
                                        longitude:(float)longitude
                                expectedCityCount:(NSInteger)expectedCityCount
                                           apiKey:(NSString *)apiKey
                                      withSuccess:(void (^)(id responseObject))success
                                      withFailure:(void (^)(NSError *error))failure
{
    // API Example: http://api.openweathermap.org/data/2.5/find?lat=34.02&lon=-118.17&cnt=10&APPID={YOUR_APIKEY}
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:[NSDecimalNumber numberWithFloat:latitude] forKey:PARAMETER_LATITUDE];
    [parameters setObject:[NSDecimalNumber numberWithFloat:longitude] forKey:PARAMETER_LONGITUDE];
    [parameters setObject:[NSDecimalNumber numberWithInteger:expectedCityCount] forKey:PARAMETER_CITY_COUNT];
    [parameters setObject:apiKey forKey:PARAMETER_APP_ID];
    
    [_sharedAfHttpSessionManager GET:API_PATH_WEATHER_AT_COORDIANTES_WITH_CITY
                          parameters:parameters
                            progress:nil
                             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                 
                                 DCParserConfiguration *parseConfig = [DCParserConfiguration configuration];
                                 
                                 DCArrayMapping *mapper = [DCArrayMapping mapperForClassElements:[LWKCity class] forAttribute:@"list" onClass:[LWKCities class]];
                                 [parseConfig addArrayMapper:mapper];
                                 
                                 // Custom mapping
                                 [parseConfig addObjectMapping:[DCObjectMapping mapKeyPath:@"id" toAttribute:@"identifier" onClass:[LWKCity class]]];
                                 [parseConfig addObjectMapping:[DCObjectMapping mapKeyPath:@"deg" toAttribute:@"degrees" onClass:[LWKWind class]]];
                                 
                                 [parseConfig addObjectMappings:[self generateTemperatureObjectMappings]];
                                 [parseConfig addObjectMappings:[self generateCoordinateObjectMappings]];
                                 
                                 DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[LWKCities class] andConfiguration:parseConfig];
                                 LWKCities *cities = [parser parseDictionary:responseObject];
                                 
                                 if ([responseObject objectForKey:@"list"])
                                 {
                                     NSArray *list = [responseObject objectForKey:@"list"];
                                     
                                     for (NSDictionary *cityDictionary in list)
                                     {
                                         NSInteger cityId = [[cityDictionary objectForKey:@"id"] integerValue];
                                         NSArray *weatherArray = [cityDictionary objectForKey:@"weather"];
                                         
                                         NSUInteger index = [cities.list indexOfObjectPassingTest:^(id obj, NSUInteger index, BOOL *stop) {
                                             LWKCity *city = (LWKCity *)obj;
                                             
                                             BOOL result = (city.identifier == cityId);
                                             return result;
                                         }];
                                         
                                         if (index != NSNotFound)
                                         {
                                             NSDictionary *weatherDictionary = [weatherArray objectAtIndex:0];
                                             
                                             LWKCity *city = [cities.list objectAtIndex:index];
                                             city.currentWeather.shortDescription = [weatherDictionary objectForKey:@"main"];
                                             city.currentWeather.description = [weatherDictionary objectForKey:@"description"];
                                             city.currentWeather.icon = [weatherDictionary objectForKey:@"icon"];
                                         }
                                         
                                     }
                                 }
                                 
                                 success(cities);
                                 
                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                 
                                 failure(error);
                                 
                             }
     ];
    
}


-(NSArray *)generateCoordinateObjectMappings
{
    NSMutableArray *mappings = [NSMutableArray new];
    
    [mappings addObject:[DCObjectMapping mapKeyPath:@"coord" toAttribute:@"coordinate" onClass:[LWKCity class]]];
    
    [mappings addObject:[DCObjectMapping mapKeyPath:@"lat" toAttribute:@"latitude" onClass:[LWKCoordinate class]]];
    [mappings addObject:[DCObjectMapping mapKeyPath:@"lon" toAttribute:@"longitude" onClass:[LWKCoordinate class]]];
    
    return [NSArray arrayWithArray:mappings];
}

-(NSArray *)generateTemperatureObjectMappings
{
    NSMutableArray *mappings = [NSMutableArray new];
    [mappings addObject:[DCObjectMapping mapKeyPath:@"main" toAttribute:@"currentWeather" onClass:[LWKCity class]]];
    
    [mappings addObject:[DCObjectMapping mapKeyPath:@"temp" toAttribute:@"temperature" onClass:[LWKWeather class]]];
    [mappings addObject: [DCObjectMapping mapKeyPath:@"temp_min" toAttribute:@"minTemperature" onClass:[LWKWeather class]]];
    [mappings addObject:[DCObjectMapping mapKeyPath:@"temp_max" toAttribute:@"maxTemperature" onClass:[LWKWeather class]]];
    
    return [NSArray arrayWithArray:mappings];
}

@end
