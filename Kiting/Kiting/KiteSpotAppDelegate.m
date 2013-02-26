//
//  KiteSpotAppDelegate.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "KiteSpotAppDelegate.h"

#import "SpotListDataController.h"

@implementation KiteSpotAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    self.dataController = [[SpotListDataController alloc] init];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@",plistPath);
    
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *list;
        list = [list initWithContentsOfFile:plistPath];
        NSLog(@"%@",list);
        
        /*NSString *contentOfFile = [NSString stringWithContentsOfFile:plistPath encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *data = [contentOfFile componentsSeparatedByString: @"\n"];
        NSInteger count = [[data objectAtIndex:0] intValue];
        
        
        NSRange range;
        range.length = 10;
        NSArray *dataForOneSpot;
        
        //FIRST I NEED TO CHANGE DATA TO ONLY BE THE ARRAY OF DATA FOR A SINGLE SPOT
        for(NSInteger i = 0; i < count; i++) {
            
            range.location = (i*10)+1; //I think this is correct
            dataForOneSpot = [data subarrayWithRange:range];
            
            [self.dataController initWithAllData:dataForOneSpot];
        }*/
        
        //self.dataController

        
        //NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
        //self.texterViewer.text = [dict objectForKey:@"text"];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //Save all the data
    NSLog(@"Entering Background");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@",plistPath);
    
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    NSArray *list = [self.dataController getMasterList];
    
    [NSKeyedArchiver archiveRootObject:list toFile:plistPath];

    for (NSInteger i = 0; i < [self.dataController countOfList]; i++) {
        [archiver encodeObject:( (ASpot*) [list objectAtIndex:i]).siteName forKey:@"siteName"];
        
        //ADD IN THE REST OF THESE ENCODE OBJECT COMMANDS
    }
    
    [archiver finishEncoding];

    
    //NSArray *list = [self.dataController getMasterList];
    BOOL success = [list writeToFile:plistPath atomically:YES];
    NSLog(@"Write to file = %c",success);
    
    /*NSInteger count = [self.dataController countOfList];
    NSString *toWrite;
    
    ASpot *aSpot;
    for(NSInteger i = 0; i < [self.dataController countOfList]; i++) {
        aSpot = [self.dataController objectInListAtIndex:i];
        
        toWrite = [NSString stringWithFormat:@"%d%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@",count,aSpot.siteName,aSpot.city,aSpot.state,aSpot.longitude,aSpot.latitude,aSpot.days,aSpot.times,aSpot.wind,aSpot.email,aSpot.phone];
        
        [toWrite writeToFile:plistPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        
        //BOOL success = [NSKeyedArchiver archiveRootObject:aSpot toFile:plistPath];
        //NSLog(@"%c",success);
    }*/
    
    
    //[[NSDictionary dictionaryWithObjectsAndKeys:self.texterViewer.text, @"text", nil] writeToFile:plistPath atomically:YES];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
