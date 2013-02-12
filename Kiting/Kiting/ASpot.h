//
//  ASpot.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASpot : NSObject

@property (nonatomic) NSInteger *longitude;
@property (nonatomic) NSInteger *latitude;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *email;
//add other contact info
@property (nonatomic, copy) NSString *times;
//@property (weak, nonatomic) NSString *days;

-(id)initAll:(NSInteger *)longitude latitude:(NSInteger *)latitude wind:(NSString *)wind email:(NSString *)email times:(NSString *)times;

-(id)setLocation:(NSInteger *)longitude latitude:(NSInteger *)latitude;



@end
