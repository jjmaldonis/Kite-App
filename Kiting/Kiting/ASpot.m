//
//  ASpot.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "ASpot.h"

@implementation ASpot

-(id) initWithLocation:(NSString *)location wind:(NSString *)wind email:(NSString *)email times:(NSString *)times
{
    self = [super init];
    if (self) {
        _location = location;
        _wind = wind;
        _email = email;
        _times = times;
        return self;
    }
    return nil;
}

@end
