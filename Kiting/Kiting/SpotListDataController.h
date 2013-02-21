//
//  SpotListDataController.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/19/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASpot.h"

@class ASpot;

@interface SpotListDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterList;

- (id)init;
- (NSMutableArray *)getMasterList;
- (NSUInteger)countOfList;
- (ASpot *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addSpot:(ASpot *)aSpot;

@end
