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

@class SpotListDataController;

@interface MapViewController : UIViewController {
    
    MKMapView *mapView;
    MKPlacemark *mPlacemark;
    CLLocationCoordinate2D location;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) SpotListDataController *dataController;

@end
