//
//  LWKWind.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 1/2/17.
//  Copyright © 2017 Anthony Arzola. All rights reserved.
//

#import "LWKWind.h"

@implementation LWKWind

@synthesize speed;
@synthesize degrees;

- (id)init
{
    if (self = [super init])
    {
        speed = 0.0;
        degrees = 0;
    }
    return self;
}

#pragma mark - NSCopying Protocol Methods

- (id)copyWithZone:(NSZone *)zone
{
    LWKWind *copy = [[self class] new];
    
    copy.speed = speed;
    copy.degrees = degrees;
    
    return copy;
}

@end
