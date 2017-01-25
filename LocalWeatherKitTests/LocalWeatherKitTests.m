//
//  LocalWeatherKitTests.m
//  LocalWeatherKitTests
//
//  Created by Anthony Arzola on 12/28/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LWKManager.h"

@interface LocalWeatherKitTests : XCTestCase
{
    LWKManager * _localWeatherManager;
    
    NSInteger _cityId;
    NSString * _apiKey;
    
    float _latitude;
    float _longitude;
    NSInteger _cityCount;
}

@end

@implementation LocalWeatherKitTests

- (void)setUp {
    [super setUp];
    
    _localWeatherManager = [LWKManager sharedInstance];
    
    _cityId = 5330582;
#warning Replace with your OpenWeatherMap API key
    _apiKey = @"REPLACE_WITH_YOUR_KEY";
    
    _latitude = 34.02;
    _longitude = -118.17;
    
}

- (void)testGetCurrentWeatherByCityId {
    
    XCTestExpectation *expectation = [self expectationWithDescription:[NSString stringWithFormat:@"Get current weather for City ID %ld", (long)_cityId]];
    
    [_localWeatherManager getCurrentWeatherByCityId:_cityId apiKey:_apiKey withSuccess:^(id responseObject) {
        
        XCTAssertTrue(responseObject != nil, @"Unable to get local weather for city.");
        [expectation fulfill];
        
    } withFailure:^(NSError *error) {
        
        XCTFail(@"Error: %@", error.localizedDescription);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)testGet5DayForecastByCityId {
    
    XCTestExpectation *expectation = [self expectationWithDescription:[NSString stringWithFormat:@"Get 5-Day weather forecast for City ID %ld", (long)_cityId]];
    
    [_localWeatherManager get5DayForecastByCityId:_cityId apiKey:_apiKey withSuccess:^(id responseObject) {
        
        XCTAssertTrue(responseObject != nil, @"Unable to get 5-Day weather forecast for city.");
        [expectation fulfill];
        
    } withFailure:^(NSError *error) {
        
        XCTFail(@"Error: %@", error.localizedDescription);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}

- (void)testGetWeatherByCoordinates {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Get weather using coordinates"];
    
    [_localWeatherManager getCurrentWeatherByCoordinatesWithLatitude:_latitude longitude:_longitude apiKey:_apiKey withSuccess:^(id responseObject) {
        
        XCTAssertTrue(responseObject != nil, @"Unable to get weather using coordinates.");
        [expectation fulfill];
        
    } withFailure:^(NSError *error) {
        
        XCTFail(@"Error: %@", error.localizedDescription);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}

- (void)testGetWeatherByCoordinatesWithCityCount {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Get weather using coordinates and expected city count"];
    
    [_localWeatherManager getCurrentWeatherByCoordinatesWithLatitude:_latitude longitude:_longitude expectedCityCount:10 apiKey:_apiKey withSuccess:^(id responseObject) {
        XCTAssertTrue(responseObject != nil, @"Unable to get weather using coordinates and city count.");
        [expectation fulfill];
        
    } withFailure:^(NSError *error) {
        
        XCTFail(@"Error: %@", error.localizedDescription);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}

@end
