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

#import "AddLocationViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    
    //Make the map rectangle (take into account the button bar) and display it for the user.
    CGRect  viewRect = CGRectMake(0, 58, 320, 373);
    self.mapView = [[MKMapView alloc] initWithFrame:viewRect];
    self.mapView.mapType = MKMapTypeHybrid;
    [self.view addSubview:self.mapView];
    self.mapView.showsUserLocation = YES;
    
    //Set the data controller
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;
    
    //Beloit Lat: 42.507793
    //Beloit Long: -89.033031
    //Coe Lat: 37.909534
    //Coe Long: -122.579956
    
    UIButton* myButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [myButton setBackgroundImage:[UIImage imageNamed:@"locIcon.png"] forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(currLocButtonAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *aBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:myButton];

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,370,320,50)];
    toolbar.tintColor = [UIColor blackColor];
    
    NSMutableArray *newItems = [self.toolbarItems mutableCopy];
    if(!newItems) {
        newItems = [[NSMutableArray alloc] init];
    }
    [newItems addObject:((UIButton*) aBarButtonItem)];
    [toolbar setItems:newItems animated:NO];
    [self.view addSubview:toolbar];
    
    [self.mapView setDelegate:self];
}

- (void)viewDidAppear:(BOOL)animated {
    //NSLog(@"In viewDidAppear");
    
    //Here we need to update the annotations on the map. We can do this easily by removing them all and then re-adding them all OR we can selectively add and remove the ones that were changed / added / deleted. I am going to go with the easy route for now because until it causes a time problem it will work really well. I will, however, leave the code I have written to do the more difficult case (commented out) in case I want to change back - as far as I can tell it works correctly.
    
    //Remove all the annotations from the map.
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    //Add all the spots in the list (we must convert them to annotations first).
    ASpot *aSpot;
    MapViewAnnotation *anAnnotation;
    CLLocationCoordinate2D loc;
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:anAnnotation reuseIdentifier:nil];
    pinView.pinColor = MKPinAnnotationColorGreen;

    for (NSInteger i = 0; i < [self.dataController countOfList]; i++) {
        aSpot = [self.dataController.masterList objectAtIndex:i];
        
        loc.latitude = (double) [aSpot.latitude doubleValue];
        loc.longitude = (double) [aSpot.longitude doubleValue];
        anAnnotation = [[MapViewAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"%@", aSpot.siteName] andCoordinate:loc andSpot:aSpot];

        [self.mapView addAnnotation:anAnnotation];
    }

    /*
    //Get all the annotations that are already on the map
    NSMutableArray *mapAnnotations = [self.mapView.annotations mutableCopy];
    
    //Add all the spots in the list if they aren't already there
    //(We must convert the spot to an annotation in order to search for it in the mapAnnotations)
    ASpot *aSpot;
    MapViewAnnotation *anAnnotation;
    CLLocationCoordinate2D loc;
    for (NSInteger i = 0; i < [self.dataController countOfList]; i++) {
        aSpot = [self.dataController.masterList objectAtIndex:i];
        
        loc.latitude = (double) [aSpot.latitude doubleValue];
        loc.longitude = (double) [aSpot.longitude doubleValue];
        anAnnotation = [[MapViewAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"%@", aSpot.siteName] andCoordinate:loc andSpot:aSpot];

        if( [mapAnnotations indexOfObject:anAnnotation] == NSNotFound ) {
        
            [self.mapView addAnnotation:anAnnotation];
        }
    }
    
    //Call this again to update the array
    mapAnnotations = [self.mapView.annotations mutableCopy];

    //Remove any spots that have been deleted by checking them all against the dataController
    //(We must convert an annotation to a spot in order to search for it in the dataController)
    NSInteger numAnnotes = [mapAnnotations count];
    for(NSInteger i = 0; i < numAnnotes -1; i++) {
    //We subtract 1 here because the Current Location is at the last mapAnnotation index.
        anAnnotation = [mapAnnotations objectAtIndex:i];
        aSpot = anAnnotation.aSpot;
        if( [self.dataController.masterList indexOfObject:aSpot] == NSNotFound ) {
            [self.mapView removeAnnotation:[mapAnnotations objectAtIndex:i]];
        }
    }
    
    //Call this again to update the array
    mapAnnotations = [self.mapView.annotations mutableCopy];
    */
     
    //Set long press gesture to add a location at the pressed location
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.view addGestureRecognizer:longPress];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MapViewAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView*    pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.pinColor = MKPinAnnotationColorGreen;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:
                                     UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(goToViewDetailsView:)
                  forControlEvents:UIControlEventTouchUpInside];
            [rightButton setBackgroundImage:[UIImage imageNamed:@"locIcon.png"] forState:UIControlStateNormal];
            //UIImage *imag = [[UIImage alloc] initWithCGImage:@"locIcon.png"];
            //[rightButton setImage:@"locIcon.png" forState:UIControlStateNormal];
            pinView.rightCalloutAccessoryView = rightButton;
        }
        else
            pinView.annotation = annotation;
        
        return pinView;
    }
    
    return nil;
}

- (IBAction)currLocButtonAction {
    //Create the span width and set viewing region around the current location
    MKCoordinateSpan span = {.latitudeDelta =  0.3, .longitudeDelta =  0.3};
    MKCoordinateRegion region = {self.mapView.userLocation.location.coordinate, span};
    [self.mapView setRegion:region animated:TRUE];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gesture
{
    //Add a popup menu with buttons on long press allowing you to add a spot at the touched location
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"Add a new spot here?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Add!",nil];
        CGPoint touchLocation = [gesture locationInView:self.mapView];
        touchCoordinate = [self.mapView convertPoint:touchLocation toCoordinateFromView:self.mapView];
        [action showFromTabBar:self.tabBarController.tabBar];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0) {
        [self performSegueWithIdentifier: @"goToDetailsFromMap" sender: self];
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    //NSLog(@"%@ pin selected.",view.annotation.title);
    
    //Set the spot selected so that if they click the details button we know which spot they selected.
    selectedSpot = ((MapViewAnnotation *) view.annotation).aSpot;
    
    //Make a button that allows them to go to the details view (uneditable).
    /*view.canShowCallout = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button addTarget:self action:@selector(goToViewDetailsView:) forControlEvents:UIControlEventTouchUpInside];
    view.rightCalloutAccessoryView = button;*/
}

-(void) goToViewDetailsView:(id)sender {
    //NSLog(@"In goToViewDetailsView function.");
    [self performSegueWithIdentifier: @"goToViewOnly" sender: self];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    //NSLog(@"%@ pin deselected.",view.annotation.title);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goToDetailsFromMap"]) {
        //Pass location data and enable editing
        AddLocationViewController *addLVC = (AddLocationViewController*) [(UINavigationController*) [segue destinationViewController] topViewController];
        
        addLVC.latitude = touchCoordinate.latitude;
        addLVC.longitude = touchCoordinate.longitude;
        addLVC.allowEditing = YES;
    }
    
    if ([[segue identifier] isEqualToString:@"goToViewOnly"]) {
        //Pass all data and disable editing
        AddLocationViewController *addLVC = (AddLocationViewController*) [(UINavigationController*) [segue destinationViewController] topViewController];
        ASpot *cellASpot = [self.dataController.masterList objectAtIndex:[self.dataController.masterList indexOfObject:selectedSpot]];
        addLVC.aSpot = cellASpot;
        addLVC.allowEditing = NO;
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if (![[self presentedViewController] isBeingDismissed]){
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        if (![[self presentedViewController] isBeingDismissed]){
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
