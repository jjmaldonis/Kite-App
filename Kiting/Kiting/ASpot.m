//
//  ASpot.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "ASpot.h"

@implementation ASpot

-(id) initAll:(NSInteger *)longitude latitude:(NSInteger *)latitude wind:(NSString *)wind email:(NSString *)email times:(NSString *)times
{
    self = [super init];
    if (self) {
        _longitude = longitude;
        _latitude = latitude;
        _wind = wind;
        _email = email;
        _times = times;
        return self;
    }
    return nil;
}

-(id) setLocation:(NSInteger *)longitude latitude:(NSInteger *)latitude
{
    if(longitude)
    {
        self.longitude = longitude;
    }
    if(latitude)
    {
        self.latitude = latitude;
    }
    
    return nil;
}

@end
