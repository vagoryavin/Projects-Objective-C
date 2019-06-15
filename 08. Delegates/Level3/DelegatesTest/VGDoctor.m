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
@property (strong, nonatomic) NSMutableArray* sickHead;
@property (strong, nonatomic) NSMutableArray* sickBody;
@property (strong, nonatomic) NSMutableArray* sickArmAndFoot;

@end

@implementation VGDoctor

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sickHead = [NSMutableArray array];
        self.sickBody = [NSMutableArray array];
        self.sickArmAndFoot = [NSMutableArray array];
    }
    return self;
}

#pragma mark - VGPatientDelegate.h
/*
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
*/

- (void) patient:(VGPatient *)patient hasTrouble:(BodyPart) organ {
    
    if (patient.organ == head) {
        NSLog(@"Patient: %@ %@ needs to take a pill", patient.name, patient.surname);
        [self.sickHead addObject: patient.name];
        
    } else if (patient.organ == body) {
        NSLog(@"Patient: %@ %@ needs to make a shot", patient.name, patient.surname);
        [self.sickBody addObject: patient.name];

    } else if (patient.organ == leftArm || patient.organ == rightArm
               || patient.organ == leftFoot || patient.organ == rightFoot){
        NSLog(@"Patient: %@ %@ needs a cast", patient.name, patient.surname);
        [self.sickArmAndFoot addObject: patient.name];

    } else {
        NSLog(@"Patient: %@ %@ does not sick anything", patient.name, patient.surname);
    }
}

- (void) raport {
    
    NSLog(@"Patients who have a sick head:");
    for (int i = 0; i < self.sickHead.count; i++) {
        NSString* name = self.sickHead[i];
        NSLog(@"Name: %@", name);
    }
    
    NSLog(@"Patients who have a sick body:");
    for (int i = 0; i < self.sickBody.count; i++) {
        NSLog(@"Name: %@", self.sickBody[i]);
    }
    
    NSLog(@"Patients who have a sick arm or foot:");
    for (int i = 0; i < self.sickArmAndFoot.count; i++) {
        NSString* name = self.sickArmAndFoot[i];
        NSLog(@"Name: %@", name);
    }
    
}

@end
