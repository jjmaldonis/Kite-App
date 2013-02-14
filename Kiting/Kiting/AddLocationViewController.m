//
//  AddLocationViewController.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "AddLocationViewController.h"

#import "ASpot.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    //NSLog(@"In Location Init");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //NSLog(@"In Location viewDidLoad");
    [super viewDidLoad];

    ASpot *aSpot = self.aSpot;
    
    if(aSpot)
    {
        NSLog(@"There was already something there!");
    }
    else if(aSpot == (NULL)) //should be the same as "else"
    {
        NSLog(@"There wasn't anything there...");
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.longitudeInput) || (textField == self.latitudeInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"In Location's done-return segue");
    
    if ([[segue identifier] isEqualToString:@"LocationReturnInput"]) {
        
        if ([self.longitudeInput.text length] || [self.latitudeInput.text length]) {
            
            //init aSpot
            self.aSpot = [[ASpot alloc] init];
            
            NSLog(@"%@",self.longitudeInput.text);
            
            self.aSpot.longitude = self.longitudeInput.text;
            self.aSpot.latitude = self.latitudeInput.text;
            
            NSLog(@"%@",self.aSpot.longitude);
        }
    }
}

//___________________________________________________



@end
