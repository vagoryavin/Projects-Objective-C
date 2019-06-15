//
//  VGBadDoctor.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 07.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGBadDoctor.h"

@implementation VGBadDoctor

#pragma mark - VGPatientDelegate.h

- (void) patientFeelsBad: (VGPatient *) patient {

    NSLog(@"Hello! My name is %@. I am your doctor.", self.name);
    
    if (patient.temperature > 36.6f) {
        NSLog(@"Patient: %@ %@ needs to drink ascorbic acid", patient.surname, patient.name);
    } else {
        NSLog(@"Patient: %@ %@ needs to make shot", patient.surname, patient.name);
    }
}

- (void) patient: (VGPatient *) patient hasQuestion: (NSString *) question {
    NSLog(@"Patient %@ asks: %@", patient.surname, question);
    NSLog (@"%@: NO!!!", self.name);
}

@end
