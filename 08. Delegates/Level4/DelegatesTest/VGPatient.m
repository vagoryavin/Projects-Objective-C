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
    BOOL iFeelGood = NO;//arc4random() % 2; // Формирования самочуствия у пациента
    self.assessment = arc4random() % 2; // Формирование мнения о докторе

    if (!iFeelGood) { // Пациент чувствует себя плохо
        [self.delegate patientFeelsBad: self]; // пациент обращается к своему доктору за помощью
        [self.delegate patient: self hasQuestion: @"Is it OK?"]; // пациент задает вопрос  доктору
        [self.delegate patient: self hasTrouble: self.organ]; // пациент говорит доктору какая часть тела у него болит
    }
    
    NSLog(@"----- I'm %@ with my doctor.", self.assessment ? @"happy" : @"unhappy");
    
    return iFeelGood;
}

@end



