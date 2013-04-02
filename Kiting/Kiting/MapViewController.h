//
//  MapViewController.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/18/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "ASpot.h"

@class SpotListDataController;

@interface MapViewController : UIViewController <UIActionSheetDelegate, MKMapViewDelegate> {
    CLLocationCoordinate2D touchCoordinate;
    ASpot *selectedSpot;
}

@property (nonatomic, strong) MKMapView *mapView;
@property (strong, nonatomic) SpotListDataController *dataController;

- (IBAction)currLocButtonAction;

@end
