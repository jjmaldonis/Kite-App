//
//  KiteSpotMasterViewController.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASpot.h"

@interface KiteSpotMasterViewController : UITableViewController

@property (strong, nonatomic) ASpot *aSpot;

//these are currently not linked bc i cant get them to work
//to link them i am supposed to go into the storyboard and select the MVC's table
//then select the detail part of each cell (ie "Label - Add ..."), then ctrl-click them,
//and click and drag New Referencing Outlet to the main MVC (in yellow)
//but if i do this i get a run time error
//i want these to update in the MVC when the data is set (along with a check mark on the side)
@property (weak, nonatomic) IBOutlet UILabel *siteNameLabel;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
