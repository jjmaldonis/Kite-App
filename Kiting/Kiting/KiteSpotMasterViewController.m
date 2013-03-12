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

#import "SpotListDataController.h"

#import "KiteSpotAppDelegate.h"


@interface KiteSpotMasterViewController () {
    
    
    
}
@end

@implementation KiteSpotMasterViewController

// I should add a delete button that then deletes the spot from the database as well

- (void)awakeFromNib
{
    //NSLog(@"In MasterVC's awakeFromNib");
    [super awakeFromNib];
    

}

- (void)viewDidLoad
{
    //NSLog(@"In MVC's viewDidLoad");
    //NSLog(@"my loc = %@",self.mapView.userLocation);

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSpot:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;
}

- (void)viewDidAppear:(BOOL)animated {
    [[self tableView] reloadData];
}

- (void)addSpot:(id)sender
{
    ASpot *aSpot = [[ASpot alloc] init];
    aSpot.siteName = @"New Spot";
    
    [self.dataController addSpot:aSpot];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:TRUE scrollPosition:0];
    [self performSegueWithIdentifier: @"goToDetails" sender: self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Spot" forIndexPath:indexPath];
    
    ASpot *aSpot = self.dataController.masterList[indexPath.row];
    cell.textLabel.text = aSpot.siteName;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataController.masterList.count;
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
        //load the previous data if there was any
        AddLocationViewController *addLVC = (AddLocationViewController*) [(UINavigationController*) [segue destinationViewController] topViewController];
        ASpot *cellASpot = [self.dataController.masterList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        addLVC.aSpot = cellASpot;
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        ASpot *aSpot = (ASpot*) [self.tableView cellForRowAtIndexPath:0];
        aSpot = ((AddLocationViewController*) [segue sourceViewController]).aSpot;
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        
        //put a checkmark
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        [[self tableView] reloadData];
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
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController.masterList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
