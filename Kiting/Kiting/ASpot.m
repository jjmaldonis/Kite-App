//
//  ASpot.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "ASpot.h"

@implementation ASpot


-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.siteName forKey:@"siteName"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.state forKey:@"state"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.days forKey:@"days"];
    [aCoder encodeObject:self.times forKey:@"times"];
    [aCoder encodeObject:self.wind forKey:@"wind"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        [self setSiteName:[aDecoder decodeObjectForKey:@"siteName"]];
        [self setCity:[aDecoder decodeObjectForKey:@"city"]];
        [self setState:[aDecoder decodeObjectForKey:@"state"]];
        [self setLongitude:[aDecoder decodeObjectForKey:@"longitude"]];
        [self setLatitude:[aDecoder decodeObjectForKey:@"latitude"]];
        [self setDays:[aDecoder decodeObjectForKey:@"days"]];
        [self setTimes:[aDecoder decodeObjectForKey:@"times"]];
        [self setWind:[aDecoder decodeObjectForKey:@"wind"]];
        [self setName:[aDecoder decodeObjectForKey:@"name"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setPhone:[aDecoder decodeObjectForKey:@"phone"]];
    }
    return self;
}

@end
