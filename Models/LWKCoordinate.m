//
//  LWKCoordinate.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 1/2/17.
//  Copyright © 2017 Anthony Arzola. All rights reserved.
//

#import "LWKCoordinate.h"

@implementation LWKCoordinate

@synthesize latitude;
@synthesize longitude;

- (id)init
{
    if (self = [super init])
    {
        latitude = 0.0;
        longitude = 0.0;
    }
    return self;
}

#pragma mark - NSCopying Protocol Methods

- (id)copyWithZone:(NSZone *)zone
{
    LWKCoordinate *copy = [[self class] new];
    
    copy.latitude = latitude;
    copy.longitude = longitude;
    
    return copy;
}

@end
