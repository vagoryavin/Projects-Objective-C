//
//  Car.m
//  DataTypesTest
//
//  Created by Горявин Владимир on 18.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Car.h"

@implementation Car

- (NSString*) whatColour{
    self.colour = arc4random()%7;
    
    // NSLog(@"number colour: %d", self.colour);
    
    switch (self.colour) {
        case White:
            return @"White";
            break;
        case Black:
            return @"Black";
            break;
        case Gray:
            return @"Gray";
            break;
        case Blue:
            return @"Blue";
            break;
        case Red:
            return @"Red";
            break;
        case Green:
            return @"Green";
            break;
        case Yellow:
            return @"Yellow";
            break;
        default:
            break;
    }
}

@end
