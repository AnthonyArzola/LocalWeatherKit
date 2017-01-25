//
//  LWKUniqueObject.m
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import "LWKUniqueObject.h"

@implementation LWKUniqueObject

@synthesize identifier;

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
    LWKUniqueObject *copy = [[[self class] alloc] init];
    copy.identifier = identifier;
    
    return copy;
}

@end
