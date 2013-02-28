//
//  MapViewController.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/18/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "MapViewController.h"

#import "MapViewAnnotation.h"

#import "SpotListDataController.h"

#import "KiteSpotAppDelegate.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;

- (void)awakeFromNib
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //NSLog(@"In MapVC's viewDidLoad");
    [super viewDidLoad];
    
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeHybrid;
    [self.view addSubview:mapView];
    self.mapView.showsUserLocation = YES;
    
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;

    //Beloit Lat: 42.507793
    //Beloit Long: -89.033031
    //Coe Lat: 37.909534
    //Coe Long: -122.579956
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"In viewDidAppear");
    //Remove all annotation on the map previously
    NSMutableArray * annotationsToRemove = [self.mapView.annotations mutableCopy] ;
    [annotationsToRemove removeObject:mapView.userLocation] ;
    [self.mapView removeAnnotations:annotationsToRemove] ;
    
    //Add all the spots in the list
    ASpot *aSpot;
    MapViewAnnotation *newAnnotation;
    CLLocationCoordinate2D loc;
    for (NSInteger i = 0; i < [self.dataController countOfList]; i++) {
        aSpot = [self.dataController.masterList objectAtIndex:i];
        loc.latitude = (double) [aSpot.latitude doubleValue];
        loc.longitude = (double) [aSpot.longitude doubleValue];
        newAnnotation = [[MapViewAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"%@", aSpot.siteName] andCoordinate:loc];
        [self.mapView addAnnotation:newAnnotation];
    }

    //Set zoom level
    CLLocationCoordinate2D coord;
    coord.latitude = self.mapView.userLocation.location.coordinate.latitude;
    coord.longitude = self.mapView.userLocation.location.coordinate.longitude;
    NSLog(@"user loc = (%f,%f)",coord.latitude,coord.longitude);
    MKCoordinateSpan span = {.latitudeDelta =  0.3, .longitudeDelta =  0.3};
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region animated:TRUE];
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"didAddAnnotationViews");
	MKAnnotationView *annotationView = [views objectAtIndex:0];
	id <MKAnnotation> mp = [annotationView annotation];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 1500, 1500);
	[mv setRegion:region animated:YES];
	[mv selectAnnotation:mp animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
