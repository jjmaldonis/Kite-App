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
    
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;
}

- (void)viewDidAppear:(BOOL)animated {
    [[self tableView] reloadData];
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
        //load the previous data
        AddLocationViewController *addLVC = (AddLocationViewController*) [(UINavigationController*) [segue destinationViewController] topViewController];
        ASpot *cellASpot = [self.dataController.masterList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        addLVC.aSpot = cellASpot;
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        [[self tableView] reloadData];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
    }
}

@end
