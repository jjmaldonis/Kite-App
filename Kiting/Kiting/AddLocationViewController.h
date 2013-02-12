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

@property (weak, nonatomic) IBOutlet UITextField *longitudeInput;
@property (weak, nonatomic) IBOutlet UITextField *latitudeInput;

@property (strong, nonatomic) ASpot *aSpot;

@end
