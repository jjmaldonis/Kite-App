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

//I need to implement my Upload! button (change the Done button to Upload!) and make sure I do error checking here, such as making sure the long and lat are actually integers. I want my Upload! button to return to the MVC after it is done and display a checkmark next to that spot when it uploaded successfully.

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
    NSLog(@"In Location viewDidLoad");
    [super viewDidLoad];

    //ASpot *aSpot = self.aSpot;
    
    if(self.aSpot)
    {
        //self.aSpot = [[ASpot alloc] init];
        
        //NSLog(@"There was already something there!");
        self.siteNameInput.text = self.aSpot.siteName;
        self.cityInput.text = self.aSpot.city;
        self.stateInput.text = self.aSpot.state;
        self.longitudeInput.text = self.aSpot.longitude;
        self.latitudeInput.text = self.aSpot.latitude;
        self.daysInput.text = self.aSpot.days;
        self.timesInput.text = self.aSpot.times;
        self.windInput.text = self.aSpot.wind;
        self.emailInput.text = self.aSpot.email;
        self.phoneInput.text = self.aSpot.phone;
        
        NSLog(@"At end of Location viewDidLoad");
        
    }
    else if(self.aSpot == (NULL))
    {
        //NSLog(@"There wasn't anything there.");
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
    //if ((textField == self.longitudeInput) || (textField == self.latitudeInput)) {
        [textField resignFirstResponder];
    //}
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
            
        //init aSpot
        //self.aSpot = [[ASpot alloc] init];

        self.aSpot.siteName = self.siteNameInput.text;
        self.aSpot.city = self.cityInput.text;
        self.aSpot.state = self.stateInput.text;
        self.aSpot.longitude = self.longitudeInput.text;
        self.aSpot.latitude = self.latitudeInput.text;
        self.aSpot.days = self.daysInput.text;
        self.aSpot.times = self.timesInput.text;
        self.aSpot.wind = self.windInput.text;
        self.aSpot.email = self.emailInput.text;
        self.aSpot.phone = self.phoneInput.text;
    }
}

//___________________________________________________



@end
