LocalWeatherKit
===========

LocalWeatherKit simplifies communication with OpenWeatherMap API.

This project creates a local pod and was developed using cocoapods 1.2.0.beta.3 and cocoapods-core 1.2.0.beta.3

## Getting Started

1. Get OpenWeatherMap API key (https://openweathermap.org/appid)

2. Reference this pod in your podfile
```
pod 'LocalWeatherKit', :path => '../LocalWeatherKit'
```
3. Add the following imports
```objc
#import "LWKManager.h"
#import "LWKCities.h"
#import "LWKCity.h"
```
4. Call methods on LWKManager to get weather data and enjoy!
```objc
-(void)getCurrentWeatherByCityId:(NSInteger)cityId
                          apiKey:(NSString *)apiKey
                     withSuccess:(void (^)(id responseObject))success
                     withFailure:(void (^)(NSError *error))failure;
```
```objc
-(void)get5DayForecastByCityId:(NSInteger)cityId
                       apiKey:(NSString *)apiKey
                  withSuccess:(void (^)(id responseObject))success
                  withFailure:(void (^)(NSError *error))failure;
```
```objc
-(void)getCurrentWeatherByCoordinatesWithLatitude:(float)latitude
                                        longitude:(float)longitude
                                           apiKey:(NSString *)apiKey
                                      withSuccess:(void (^)(id responseObject))success
                                      withFailure:(void (^)(NSError *error))failure;
```
```objc
-(void)getCurrentWeatherByCoordinatesWithLatitude:(float)latitude
                                        longitude:(float)longitude
                                expectedCityCount:(NSInteger)expectedCityCount
                                           apiKey:(NSString *)apiKey
                                      withSuccess:(void (^)(id responseObject))success
                                      withFailure:(void (^)(NSError *error))failure;
```                     

## License
The MIT License (MIT)

Copyright (c) 2017 Anthony Arzola

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
