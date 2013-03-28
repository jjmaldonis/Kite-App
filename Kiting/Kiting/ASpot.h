//
//  ASpot.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASpot : NSObject <NSCoding>

@property (nonatomic, copy) NSString *siteName;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *days;
@property (nonatomic, copy) NSString *times;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;

@end