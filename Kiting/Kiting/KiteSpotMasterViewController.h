//
//  KiteSpotMasterViewController.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASpot.h"

@class SpotListDataController;

@interface KiteSpotMasterViewController : UITableViewController

@property (strong, nonatomic) ASpot *aSpot;

@property (strong, nonatomic) SpotListDataController *dataController;

//- (IBAction)done:(UIStoryboardSegue *)segue;
//- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
