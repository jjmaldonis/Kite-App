//
//  MapViewAnnotation.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/18/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d andSpot:(ASpot *)spot{
	self.title = ttl;
	self.coordinate = c2d;
    self.aSpot = spot;
	return self;
}

@end
