//
//  Car.h
//  DataTypesTest
//
//  Created by Горявин Владимир on 18.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    ManualTransmission,
    AutomaticTransmission
} Transmission;

typedef enum{
    White,
    Black,
    Gray,
    Blue,
    Red,
    Green,
    Yellow
} Colour;

@interface Car : NSObject

@property (strong, nonatomic) NSString* brand;
@property (assign, nonatomic) Transmission transmission;
@property (assign, nonatomic) Colour colour;

- (NSString*) whatColour;

@end
