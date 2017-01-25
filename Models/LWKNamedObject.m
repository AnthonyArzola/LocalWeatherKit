//
//  LWKNamedObject.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import "LWKNamedObject.h"

@implementation LWKNamedObject

@synthesize name;
@synthesize description;

- (id)init
{
    if (self = [super init])
    {

    }
    
    return self;
}

#pragma mark - NSCopying Protocol Methods

- (id)copyWithZone:(NSZone *)zone
{
    LWKNamedObject *copy = [super copyWithZone:zone];
    
    copy.name = [name copyWithZone: zone];
    copy.description = [description copyWithZone:zone];
    
    return copy;
}

@end
