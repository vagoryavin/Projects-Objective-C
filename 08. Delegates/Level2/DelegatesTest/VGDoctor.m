//
//  VGDoctor.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGDoctor.h"

@interface VGDoctor()

@property (assign , nonatomic) BOOL patientIsOK;

@end

@implementation VGDoctor

#pragma mark - VGPatientDelegate.h

- (void) patientFeelsBad: (VGPatient *) patient {
    
    NSLog(@"Hello! My name is %@. I am your doctor.", self.name);
    
    if (patient.temperature > 36.6f && patient.temperature <= 38.f ) {
        NSLog(@"Patient: %@ %@ needs to take a pill", patient.name, patient.surname);
        
        if (patient.isHeadache || patient.isSoreThroat) {
            NSLog(@"Patient: %@ %@ needs to make a shot", patient.name, patient.surname);
        }
        
        self.patientIsOK = YES;
        
    } else if (patient.temperature > 38.f && patient.temperature <= 39.9f) {
        NSLog(@"Patient: %@ %@ needs to make a shot", patient.name, patient.surname);
        
        if (patient.isHeadache || patient.isSoreThroat) {
            NSLog(@"Patient: %@ %@ needs to be hospitalized", patient.name, patient.surname);
        }
        
        self.patientIsOK = NO;
        
    } else if (patient.temperature > 39.9f) {
        NSLog(@"Patient: %@ %@ needs to be hospitalized urgently", patient.name, patient.surname);
        self.patientIsOK = NO;

    } else {
        NSLog(@"Patient: %@ %@ needs relaxation", patient.name, patient.surname);
        self.patientIsOK = YES;
    }
    
}

- (void) patient: (VGPatient *) patient hasQuestion: (NSString *) question {
    NSLog(@"Patient %@ asks: %@", patient.surname, question);
    
    if (!self.patientIsOK) {
        NSLog(@"You have a serious sickness. You need hospitalization.");
        
    } else {
        NSLog(@"That is all right. Don't worry.");
    }
}

@end
