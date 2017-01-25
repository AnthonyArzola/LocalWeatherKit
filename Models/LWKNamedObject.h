//
//  LWKNamedObject.h
//  LocalWeatherKit
//
//  Created by Anthony Arzola on 8/23/16.
//  Copyright © 2016 Anthony Arzola. All rights reserved.
//

#import "LWKUniqueObject.h"

@interface LWKNamedObject : LWKUniqueObject <NSCopying>
{

}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;

@end
