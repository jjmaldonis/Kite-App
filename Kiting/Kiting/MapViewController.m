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
    //NSLog(@"In MapVC's awakeFromNib");
    
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
	// Do any additional setup after loading the view.
    
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;
    
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D coord = {.latitude =  42.507793, .longitude =  -89.033031};
    MKCoordinateSpan span = {.latitudeDelta =  0.1, .longitudeDelta =  0.1};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region animated:TRUE];
    [self.view addSubview:mapView];
    
    // Set some coordinates for our position (Buckingham Palace!)
	/*CLLocationCoordinate2D loc;
	loc.latitude = (double) 42.507793;
	loc.longitude = (double) -89.033031;
    
	// Add the annotation to our map view
	MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:@"Beloit" andCoordinate:loc];
	[self.mapView addAnnotation:newAnnotation];*/

    self.mapView.showsUserLocation = YES;
    
    NSLog(@"my loc = (%f,%f)",self.mapView.userLocation.location.coordinate.longitude,self.mapView.userLocation.location.coordinate.latitude);

}

- (void)viewDidAppear:(BOOL)animated {
    
    NSMutableArray * annotationsToRemove = [self.mapView.annotations mutableCopy] ;
    [annotationsToRemove removeObject:mapView.userLocation] ;
    [self.mapView removeAnnotations:annotationsToRemove] ;
    
    NSLog(@"In viewDidAppear");
    ASpot *aSpot;
    MapViewAnnotation *newAnnotation;
    CLLocationCoordinate2D loc;
    
    for (NSInteger i = 0; i < [self.dataController countOfList]; i++) {

        aSpot = [self.dataController.masterList objectAtIndex:i];
        loc.latitude = (double) [aSpot.latitude doubleValue];
        loc.longitude = (double) [aSpot.longitude doubleValue];

        newAnnotation = [[MapViewAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"%@ (%@,%@)", aSpot.siteName, aSpot.longitude, aSpot.latitude] andCoordinate:loc];

        [self.mapView addAnnotation:newAnnotation];
    }

}

// When a map annotation point is added, zoom to it (1500 range)
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
