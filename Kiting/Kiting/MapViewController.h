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

@interface MapViewController : UIViewController <UIActionSheetDelegate, MKMapViewDelegate> {
    
    MKMapView *mapView;
    MKPlacemark *mPlacemark;
    CLLocationCoordinate2D location;
    CLLocationCoordinate2D touchCoordinate;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) SpotListDataController *dataController;

@property (nonatomic, retain) IBOutlet UIButton *currLocButton;

- (IBAction)currLocButton;

@end
