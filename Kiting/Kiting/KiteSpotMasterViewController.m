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


@interface KiteSpotMasterViewController ()
@end

@implementation KiteSpotMasterViewController

- (void)awakeFromNib
{
    //NSLog(@"In MasterVC's awakeFromNib");
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    //NSLog(@"In MVC's viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Make a standard edit button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //Set the data controller
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
        addLVC.allowEditing = YES;
    }
    if ([[segue identifier] isEqualToString:@"createNewSpot"]) {
        AddLocationViewController *addLVC = (AddLocationViewController*) [(UINavigationController*) [segue destinationViewController] topViewController];
        addLVC.allowEditing = YES;
    }
}

/*- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        [[self tableView] reloadData];
        
        if (![[self presentedViewController] isBeingDismissed]){
            [self dismissViewControllerAnimated:YES completion:NULL];
        }

        //[self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}*/


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController.masterList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
