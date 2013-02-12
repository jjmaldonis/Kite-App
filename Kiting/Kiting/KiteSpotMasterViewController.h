//
//  KiteSpotMasterViewController.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KiteSpotMasterViewController : UITableViewController

@property (nonatomic, copy) IBOutlet UILabel *location;
@property (nonatomic, copy) IBOutlet UILabel *wind;
@property (nonatomic, copy) IBOutlet UILabel *email;
//add other contact info?
@property (nonatomic, copy) IBOutlet UILabel *times;
//@property (weak, nonatomic) NSString *days;


- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
