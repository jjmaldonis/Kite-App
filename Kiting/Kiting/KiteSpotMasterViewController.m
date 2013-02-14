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
    //NSLog(@"In MVC's awakeFromNib");
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    //NSLog(@"In MVC's viewDidLoad");
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
    //NSLog(@"In MVC's canEditRowAtIndexPath");
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*if ([[segue identifier] isEqualToString:@"ShowSightingDetails"]) {
        BirdsDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];*/

    if ([[segue identifier] isEqualToString:@"goToLocationDetails"]) {
        //NSLog(@"In segue to Location Details");
        //NSLog(@"segue: %@",segue);
        //NSLog(@"identifier = %@",[segue identifier]);
        NSLog(@"dest = %@",[segue destinationViewController]);
        //NSLog(@"source = %@",[segue sourceViewController]);
        
        //load the previous data if there was any
        if(self.aSpot)
        {
            AddLocationViewController *addLVC = (AddLocationViewController*) [segue destinationViewController];
            
            if(addLVC)
            {
                NSLog(@"It is alive!");
            }

            //addLVC.aSpot = [[ASpot alloc] init];
            
            if(self.aSpot.latitude)
            {
                NSLog(@"lat to be sent = %@",self.aSpot.latitude);
                //send latitude to location view controller
                UITextField *longtext;
                longtext.text = self.aSpot.latitude;
                [addLVC setLongitudeInput:longtext];
                
                //addLVC.latitudeInput.text = self.aSpot.latitude;
                //NSLog(@"lat set to = %@",addLVC.aSpot.latitude);
            }
            if(self.aSpot.longitude)
            {
                NSLog(@"long to be sent = %@",self.aSpot.longitude);
                //send longitude to location view controller
                //[addLVC setLongitudeInput:self.aSpot.longitude];
                //addLVC.longitudeInput.text = self.aSpot.longitude;
                //NSLog(@"long set to = %@",addLVC.aSpot.longitude);
            }
        }
         
        //NSLog(@"loc = %@",_locationLabel);
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
    //here i want to save the data they input, but if they didn't input into all the required fields I don't want to let them return. I do want to save the data they input tho so that if they click cancel and then come back here later the data they input is still there.
    //i probably also need to do something else, see the commented out portion above
    //put a checkmark by location if this all goes through
    
    //NSLog(@"In MVC's done:");
    if ([[segue identifier] isEqualToString:@"LocationReturnInput"]) {
        
        //save any input -- I think this is going to overwrite the any previous stuff so i need to fix that
        self.aSpot = ((AddLocationViewController*) [segue sourceViewController]).aSpot;
        NSLog(@"long = %@",self.aSpot.longitude);
        
        if( /* all the variables that are essential were specified, allow them to go back, else dont*/ 1)
        {
            
            //NSLog(@"Should add a checkmark");
            //set a checkmark - CHANGE THAT 0 AT THE END TO THE CORRECT ROW
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:0];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            //update the "Add ..." details to reflect their input
            self.locationLabel.text =[NSString stringWithFormat:@"(%@, %@)", self.aSpot.longitude, self.aSpot.latitude];
            
            [[self tableView] reloadData];
            
            //let them go back to the MVC
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    //NSLog(@"In MVC's cance:");
    if ([[segue identifier] isEqualToString:@"LocationCancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
