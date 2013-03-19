//
//  MapViewAnnotation.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/18/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ASpot.h"

@interface MapViewAnnotation : NSObject <MKAnnotation> {
    NSString *title;
	CLLocationCoordinate2D coordinate;
    ASpot* aSpot;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d andSpot:(ASpot*)spot;



@end
