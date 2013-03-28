//
//  SpotListDataController.m
//  Kiting
//
//  Created by JASON MALDONIS on 2/19/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import "SpotListDataController.h"

#import "ASpot.h"

@interface SpotListDataController ()
@end

@implementation SpotListDataController

- (id)init {
    if (self = [super init]) {
        self.masterList = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}

- (void)initWithAllData:(NSArray *)data{
    
    ASpot *aSpot;
    aSpot.siteName = [data objectAtIndex:0];
    aSpot.city = [data objectAtIndex:1];
    aSpot.state = [data objectAtIndex:2];
    aSpot.longitude = [data objectAtIndex:3];
    aSpot.latitude = [data objectAtIndex:4];
    aSpot.days = [data objectAtIndex:5];
    aSpot.times = [data objectAtIndex:6];
    aSpot.wind = [data objectAtIndex:7];
    aSpot.name   = [data objectAtIndex:8];
    aSpot.email = [data objectAtIndex:9];
    aSpot.phone = [data objectAtIndex:10];
    
    [self.masterList insertObject:aSpot atIndex:0];
    
}


- (void)setMasterList:(NSMutableArray *)newList {
    if (_masterList != newList) {
        _masterList = [newList mutableCopy];
    }
}

- (NSMutableArray *)getMasterList {
    return self.masterList;
}

- (NSUInteger)countOfList {
    return [self.masterList count];
}

- (ASpot *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterList objectAtIndex:theIndex];
}

- (void)addSpot:(ASpot *)aSpot {
    [self.masterList insertObject:aSpot atIndex:0];
}

@end
