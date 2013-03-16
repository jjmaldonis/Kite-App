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
    
    self.dataController = ((KiteSpotAppDelegate *) [[UIApplication sharedApplication] delegate]).dataController;

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
        self.emailInput.text = self.aSpot.email;
        self.phoneInput.text = self.aSpot.phone;
    }
    else{
        self.siteNameInput.text = @"Temp Site Name";
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
    if ([identifier isEqualToString:@"ReturnInput"]) {
        
        //Make sure there is a name, latitude, and longitude.
        if( [self.longitudeInput.text length] == 0 || [self.latitudeInput.text length] == 0 || [self.siteNameInput.text length] == 0 ) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"You must enter a name, the latitude, and the longitude at minimum." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
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
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Latitude must be a number between -90 and 90." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                return NO;
            }
            else {
                CGFloat numbericLat = [self.latitudeInput.text floatValue];
                if(numbericLat < -90 || numbericLat > 90) {
                    NSLog(@"                 2");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Latitude must be a number between -90 and 90." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alert show];
                    return NO;
                }
            }
            scanner = [NSScanner scannerWithString:self.longitudeInput.text];
            status = [scanner scanDouble:&result];
            status = status && scanner.scanLocation == self.longitudeInput.text.length;
            if( status == NO) {
                NSLog(@"                 3");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Longitude must be a number between -180 and 180." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                return NO;
            }
            else {
                CGFloat numbericLong = [self.longitudeInput.text floatValue];
                if(numbericLong < -180 || numbericLong > 180) {
                    NSLog(@"                 4");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Longitude must be a number between -180 and 180." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alert show];
                    return NO;
                }
            }
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        if(!self.aSpot)
        {
            self.aSpot = [[ASpot alloc] init];
            [self.dataController addSpot:self.aSpot];
        }
        else
        {
        }

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

@end
