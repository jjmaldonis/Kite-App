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
    
    NSMutableArray *masterList;
    
}
@end

@implementation KiteSpotMasterViewController

// I should add a delete button that then deletes the spot from the database as well

- (void)awakeFromNib
{
    //NSLog(@"In MVC's awakeFromNib");
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    NSLog(@"In MVC's viewDidLoad");
    //NSLog(@"my loc = %@",self.mapView.userLocation);

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSpot:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)addSpot:(id)sender
{
    if (!masterList) {
        masterList = [[NSMutableArray alloc] init];
    }
    ASpot *aSpot = [[ASpot alloc] init];
    aSpot.siteName = @"New Spot";
    [masterList insertObject:aSpot atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:TRUE scrollPosition:0];
    [self performSegueWithIdentifier: @"goToDetails" sender: self];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Spot" forIndexPath:indexPath];
    
    ASpot *aSpot = masterList[indexPath.row];
    cell.textLabel.text = aSpot.siteName;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return masterList.count;
}

- (void)configureView
{
    // Update the user interface for the master.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"goToDetails"]) {
        NSLog(@"In segue to Location Details"); //NSLog(@"segue: %@",segue); //NSLog(@"identifier = %@",[segue identifier]); //NSLog(@"source = %@",[segue sourceViewController]); //NSLog(@"dest = %@",[segue destinationViewController]);
        
        //load the previous data if there was any
        AddLocationViewController *addLVC = (AddLocationViewController*) [(UINavigationController*) [segue destinationViewController] topViewController];
        
        ASpot *cellASpot = [masterList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        //(ASpot*) [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        
        addLVC.aSpot = cellASpot; //self.aSpot;
        NSLog(@"cell = %@",cellASpot);
        
        NSLog(@"sending siteName = %@",cellASpot.siteName);
        //NSLog(@"#rows = %d",[self.tableView indexPathForSelectedRow].row);
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    //here i want to save the data they input, but if they didn't input into all the required fields I don't want to let them return. I do want to save the data they input tho so that if they click cancel and then come back here later the data they input is still there.
    //i probably also need to do something else, see the commented out portion above
    //put a checkmark by location if this all goes through
    
    //NSLog(@"In MVC's done:");
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        //save any input -- I think this is going to overwrite the any previous stuff so i need to fix that
        
        //self.aSpot = ((AddLocationViewController*) [segue sourceViewController]).aSpot;
        ASpot *aSpot = (ASpot*) [self.tableView cellForRowAtIndexPath:0];
        aSpot = ((AddLocationViewController*) [segue sourceViewController]).aSpot;
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //cell.textLabel = aSpot.siteName;
        
        NSLog(@"recieved siteName = %@",aSpot.siteName);

        //set a checkmark
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        //update the "Add ..." details to reflect their input
        //self.locationLabel.text =[NSString stringWithFormat:@"(%@, %@)", self.aSpot.longitude, self.aSpot.latitude];
        
        [[self tableView] reloadData];
        
        //let them go back to the MVC
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    //NSLog(@"In MVC's cance:");
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"In MVC's canEditRowAtIndexPath");
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [masterList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
