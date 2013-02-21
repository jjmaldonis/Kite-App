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
