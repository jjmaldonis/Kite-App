//
//  KiteSpotMasterViewController.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "KiteSpotMasterViewController.h"

#import "KiteSpotDetailViewController.h"

#import "ASpot.h"

#import "AddLocationViewController.h"


@interface KiteSpotMasterViewController () {
    
}
@end

@implementation KiteSpotMasterViewController

- (void)awakeFromNib
{
    NSLog(@"In MVC's awakeFromNib");
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    NSLog(@"In MVC's viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)configureView
{
    // Update the user interface for the master.
    ASpot *aSpot = self.aSpot;
    
    if (aSpot) {
        //self.locationLabel.text = aSpot.location;
        self.timesLabel.text = aSpot.times;
        self.windLabel.text = aSpot.wind;
        self.emailLabel.text = aSpot.email;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"In MVC's canEditRowAtIndexPath");
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*if ([[segue identifier] isEqualToString:@"ShowSightingDetails"]) {
        BirdsDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];*/

    if ([[segue identifier] isEqualToString:@"goToLocationDetails"]) {
        NSLog(@"In segue to Location Details");
        NSLog(@"segue: %@",segue);
        NSLog(@"identifier = %@",[segue identifier]);
        NSLog(@"dest = %@",[segue destinationViewController]);
        NSLog(@"source = %@",[segue sourceViewController]);
        //load the previous data if there was any
    }
    
    if ([[segue identifier] isEqualToString:@"goToTimesDetails"]) {
        //load the previous data if there was any
    }
    
    if ([[segue identifier] isEqualToString:@"goToWindDetails"]) {
        //load the previous data if there was any
    }
    
    if ([[segue identifier] isEqualToString:@"goToContactDetails"]) {
        //load the previous data if there was any
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    NSLog(@"In MVC's done:");
    if ([[segue identifier] isEqualToString:@"LocationReturnInput"]) {
        
        /*AddSightingViewController *addController = [segue sourceViewController];
        if (addController.birdSighting) {
            [self.dataController addBirdSightingWithSighting:addController.birdSighting];
            [[self tableView] reloadData];
        }*/
        
        //here i want to save the data they input, but if they didn't input into all the required fields I don't want to let them return. I do want to save the data they input tho so that if they click cancel and then come back here later the data they input is still there.
        //i probably also need to do something else, see the commented out portion above
        //put a checkmark by location if this all goes through
        
        //[[self tableView] reloadData];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    NSLog(@"In MVC's cance:");
    if ([[segue identifier] isEqualToString:@"LocationCancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
