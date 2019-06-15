//
//  VGPatient.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGPatient.h"

@implementation VGPatient

- (BOOL) iGetSick {
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
       // [self.delegate patientFeelsBad: self];
       // [self.delegate patient: self hasQuestion: @"Is it OK?"];
        [self.delegate patient: self hasTrouble: self.organ];

    }
    
    return iFeelGood;
}

@end



