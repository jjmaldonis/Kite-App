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
    //NSMutableArray *_objects;
}
@end

@implementation KiteSpotMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*if ([[segue identifier] isEqualToString:@"ShowSightingDetails"]) {
        BirdsDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];*/

    if ([[segue identifier] isEqualToString:@"goToLocationDetails"]) {
        //load the previous data if there was any
    }
    
    if ([[segue identifier] isEqualToString:@"goToTimesDetails"]) {
        //load the previous data if there was any
    }
    
    if ([[segue identifier] isEqualToString:@"goToWindDetails"]) {
        //load the previous data if there was any
    }
    
    if ([[segue identifier] isEqualToString:@"goToEmailDetails"]) {
        //load the previous data if there was any
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"LocationReturnInput"]) {
        
        /*AddSightingViewController *addController = [segue sourceViewController];
        if (addController.birdSighting) {
            [self.dataController addBirdSightingWithSighting:addController.birdSighting];
            [[self tableView] reloadData];
        }*/
        
        //here i want to save the data they input, but if they didn't input into all the required fields I don't want to let them return. I do want to save the data they input tho so that if they click cancel and then come back here later the data they input is still there.
        //i probably also need to do something else, see the commented out portion above
        
        //[[self tableView] reloadData];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"LocationCancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
