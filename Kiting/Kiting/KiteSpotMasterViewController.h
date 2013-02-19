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
@property (weak, nonatomic) IBOutlet UILabel *siteNameLabel;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
