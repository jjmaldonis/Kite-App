//
//  ASpot.h
//  Kiting
//
//  Created by JASON MALDONIS on 2/12/13.
//  Copyright (c) 2013 JASON MALDONIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASpot : NSObject

@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *email;
//add other contact info
@property (nonatomic, copy) NSString *times;
//@property (weak, nonatomic) NSString *days;

-(id)initAll:(NSString *)longitude latitude:(NSString *)latitude wind:(NSString *)wind email:(NSString *)email times:(NSString *)times;

-(id)setLocation:(NSString *)longitude latitude:(NSString *)latitude;



@end
