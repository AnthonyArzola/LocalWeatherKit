//
//  LWKConstants.h
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#ifndef LWKConstants_h
#define LWKConstants_h

/*! Open Weather base URL http://api.openweathermap.org/ */
static NSString * const API_BASE_URL = @"http://api.openweathermap.org/data/2.5/";;

/*! weather: Get weather by City ID */
static NSString * const API_PATH_WEATHER_BY_CITY_ID = @"weather";
/*! forecast/city: Get forecasted weather for 5 days with data every 3 hours by City ID */
static NSString * const API_PATH_FORECAST_BY_CITY_ID = @"forecast";
/*! weather: Get current weather at specified coordinates */
static NSString * const API_PATH_WEATHER_AT_COORDIANTES =@"weather";
/*! find: Get current weather at specified coordinates with number of expected cities around coordinate */
static NSString * const API_PATH_WEATHER_AT_COORDIANTES_WITH_CITY =@"find";


/*! id */
static NSString * const PARAMETER_CITY_ID = @"id";
/*! AppId */
static NSString * const PARAMETER_APP_ID = @"AppId";
/*! lat */
static NSString * const PARAMETER_LATITUDE = @"lat";
/*! lon */
static NSString * const PARAMETER_LONGITUDE = @"lon";
/*! cnt */
static NSString * const PARAMETER_CITY_COUNT = @"cnt";


/*! Empty GUID */
static NSString * const EMPTY_GUID = @"00000000-0000-0000-0000-000000000000";

static float const KELVIN_FAHRENHEIT_DELTA = 459.67;
static float const KELVIN_CELSIUS_DELTA = 273.15;


/*! Date Time format yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ */
static NSString * const END_DATETIME_FORMAT = @"yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ";

#endif /* LWKConstants_h */
