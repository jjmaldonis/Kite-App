//
//  AddLocationViewController.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "AddLocationViewController.h"

#import "ASpot.h"

#import "KiteSpotAppDelegate.h"

#import "SpotListDataController.h"

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
    //NSLog(@"In Location viewDidLoad");
    [super viewDidLoad];

    //Set the data controller
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;

    //If a spot was assigned in the prepareForSegue then we need to set information in this view; if not, give some default information depending on what was provided
    if(self.aSpot)
    {
        self.siteNameInput.text = self.aSpot.siteName;
        self.cityInput.text = self.aSpot.city;
        self.stateInput.text = self.aSpot.state;
        self.longitudeInput.text = self.aSpot.longitude;
        self.latitudeInput.text = self.aSpot.latitude;
        self.daysInput.text = self.aSpot.days;
        self.timesInput.text = self.aSpot.times;
        self.windInput.text = self.aSpot.wind;
        self.nameInput.text = self.aSpot.name;
        self.emailInput.text = self.aSpot.email;
        self.phoneInput.text = self.aSpot.phone;
    }
    else {
        self.siteNameInput.text = @"Temp Site Name";
        
        if(self.latitude){
            self.latitudeInput.text = [NSString stringWithFormat:@"%f",self.latitude];
        }
        if(self.longitude){
            self.longitudeInput.text = [NSString stringWithFormat:@"%f",self.longitude];
        }
    }

    //self.allowEditing is set in the prepareForSegue functions in the view controller classes
    if(!self.allowEditing){
        [self.siteNameInput setUserInteractionEnabled:NO];
        [self.cityInput setUserInteractionEnabled:NO];
        [self.stateInput setUserInteractionEnabled:NO];
        [self.longitudeInput setUserInteractionEnabled:NO];
        [self.latitudeInput setUserInteractionEnabled:NO];
        [self.daysInput setUserInteractionEnabled:NO];
        [self.timesInput setUserInteractionEnabled:NO];
        [self.windInput setUserInteractionEnabled:NO];
        [self.nameInput setUserInteractionEnabled:NO];
        [self.emailInput setUserInteractionEnabled:NO];
        [self.phoneInput setUserInteractionEnabled:NO];
        
        [self.siteNameInput setBorderStyle:UITextBorderStyleNone];
        [self.cityInput setBorderStyle:UITextBorderStyleNone];
        [self.stateInput setBorderStyle:UITextBorderStyleNone];
        [self.longitudeInput setBorderStyle:UITextBorderStyleNone];
        [self.latitudeInput setBorderStyle:UITextBorderStyleNone];
        [self.daysInput setBorderStyle:UITextBorderStyleNone];
        [self.timesInput setBorderStyle:UITextBorderStyleNone];
        [self.windInput setBorderStyle:UITextBorderStyleNone];
        [self.nameInput setBorderStyle:UITextBorderStyleNone];
        [self.emailInput setBorderStyle:UITextBorderStyleNone];
        [self.phoneInput setBorderStyle:UITextBorderStyleNone];
        
        [self.siteNameInput setClearButtonMode:UITextFieldViewModeNever];
        [self.cityInput setClearButtonMode:UITextFieldViewModeNever];
        [self.stateInput setClearButtonMode:UITextFieldViewModeNever];
        [self.longitudeInput setClearButtonMode:UITextFieldViewModeNever];
        [self.latitudeInput setClearButtonMode:UITextFieldViewModeNever];
        [self.daysInput setClearButtonMode:UITextFieldViewModeNever];
        [self.timesInput setClearButtonMode:UITextFieldViewModeNever];
        [self.windInput setClearButtonMode:UITextFieldViewModeNever];
        [self.nameInput setClearButtonMode:UITextFieldViewModeNever];
        [self.emailInput setClearButtonMode:UITextFieldViewModeNever];
        [self.phoneInput setClearButtonMode:UITextFieldViewModeNever];
    }
    else {
        [self.siteNameInput setUserInteractionEnabled:YES];
        [self.cityInput setUserInteractionEnabled:YES];
        [self.stateInput setUserInteractionEnabled:YES];
        [self.longitudeInput setUserInteractionEnabled:YES];
        [self.latitudeInput setUserInteractionEnabled:YES];
        [self.daysInput setUserInteractionEnabled:YES];
        [self.timesInput setUserInteractionEnabled:YES];
        [self.windInput setUserInteractionEnabled:YES];
        [self.nameInput setUserInteractionEnabled:YES];
        [self.emailInput setUserInteractionEnabled:YES];
        [self.phoneInput setUserInteractionEnabled:YES];
        
        [self.siteNameInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.cityInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.stateInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.longitudeInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.latitudeInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.daysInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.timesInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.windInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.nameInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.emailInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.phoneInput setBorderStyle:UITextBorderStyleRoundedRect];
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
        [textField resignFirstResponder];
    return YES;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    //When they click the done button we need to do some data checking to make sure they put in usable data.
    if ([identifier isEqualToString:@"ReturnInput"]) {
        
        //Make sure there is a name, latitude, and longitude.
        if( [self.longitudeInput.text length] == 0 || [self.latitudeInput.text length] == 0 || [self.siteNameInput.text length] == 0 ) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You must enter a name, the latitude, and the longitude at minimum." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            return NO;
        }
        //Since the long and lat exist, make sure they are actually numbers between the correct values.
        else {
            bool status;
            NSScanner *scanner;
            double result;
            scanner = [NSScanner scannerWithString:self.latitudeInput.text];
            status = [scanner scanDouble:&result];
            status = status && scanner.scanLocation == self.latitudeInput.text.length;
            if( status == NO ) {
                NSLog(@"                 1");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Latitude must be a number between -90 and 90." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                return NO;
            }
            else {
                CGFloat numbericLat = [self.latitudeInput.text floatValue];
                if(numbericLat < -90 || numbericLat > 90) {
                    NSLog(@"                 2");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Latitude must be a number between -90 and 90." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alert show];
                    return NO;
                }
            }
            scanner = [NSScanner scannerWithString:self.longitudeInput.text];
            status = [scanner scanDouble:&result];
            status = status && scanner.scanLocation == self.longitudeInput.text.length;
            if( status == NO) {
                NSLog(@"                 3");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Longitude must be a number between -180 and 180." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                return NO;
            }
            else {
                CGFloat numbericLong = [self.longitudeInput.text floatValue];
                if(numbericLong < -180 || numbericLong > 180) {
                    NSLog(@"                 4");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Longitude must be a number between -180 and 180." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alert show];
                    return NO;
                }
            }
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //If we get to this point from the "Done" button we need to update our spot or add it to the dataController if it is a new spot
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if(!self.aSpot)
        {
            self.aSpot = [[ASpot alloc] init];
            [self.dataController addSpot:self.aSpot];
        }

        self.aSpot.siteName = self.siteNameInput.text;
        self.aSpot.city = self.cityInput.text;
        self.aSpot.state = self.stateInput.text;
        self.aSpot.longitude = self.longitudeInput.text;
        self.aSpot.latitude = self.latitudeInput.text;
        self.aSpot.days = self.daysInput.text;
        self.aSpot.times = self.timesInput.text;
        self.aSpot.wind = self.windInput.text;
        self.aSpot.name = self.nameInput.text;
        self.aSpot.email = self.emailInput.text;
        self.aSpot.phone = self.phoneInput.text;
    }
}

@end
