//
//  AddLocationViewController.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASpot;

@interface AddLocationViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *siteNameInput;
@property (weak, nonatomic) IBOutlet UITextField *cityInput;
@property (weak, nonatomic) IBOutlet UITextField *stateInput;
@property (weak, nonatomic) IBOutlet UITextField *longitudeInput;
@property (weak, nonatomic) IBOutlet UITextField *latitudeInput;
@property (weak, nonatomic) IBOutlet UITextField *daysInput;
@property (weak, nonatomic) IBOutlet UITextField *timesInput;
@property (weak, nonatomic) IBOutlet UITextField *windInput;
@property (weak, nonatomic) IBOutlet UITextField *emailInput;
@property (weak, nonatomic) IBOutlet UITextField *phoneInput;

@property (strong, nonatomic) ASpot *aSpot;

@property (nonatomic, assign) BOOL isNew;

@end
