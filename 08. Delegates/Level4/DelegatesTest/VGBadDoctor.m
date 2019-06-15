//
//  VGBadDoctor.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 07.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGBadDoctor.h"

@interface VGBadDoctor()

@property (strong, nonatomic) NSMutableArray* sickOrgan; // массив пациентов у которых болит любая часть тела

@end

@implementation VGBadDoctor

- (instancetype)init {
    self = [super init];
    if (self) {
        // инициализируем массив
        self.sickOrgan = [NSMutableArray array];
    }
    return self;
}

#pragma mark - VGPatientDelegate.h

// Пациент пришел со своей болезнью
- (void) patientFeelsBad: (VGPatient *) patient {

    NSLog(@"Hello! My name is %@. I am your doctor.", self.name);
    
    // У пациента температура больше 36.6 градусов, ему надо выпить оскорбинку
    if (patient.temperature > 36.6f) {
        NSLog(@"Patient: %@ %@ needs to drink ascorbic acid", patient.surname, patient.name);
    
    // У пациента температура меньше или равна 36.6 градусов, ему надо сделать укол
    } else {
        NSLog(@"Patient: %@ %@ needs to make shot", patient.surname, patient.name);
        
    }
}

// Пациент задает вопрос доктору
- (void) patient: (VGPatient *) patient hasQuestion: (NSString *) question {
    NSLog(@"Patient %@ asks: %@", patient.surname, question);
    NSLog (@"%@: NO!!!", self.name);
    
}

// Пацент обращается к доктору с болью в какой-то части тела
- (void) patient:(VGPatient *)patient hasTrouble:(BodyPart) organ {
   
    NSLog(@"Patient: %@ %@ has to put a plantain", patient.name, patient.surname);
    // добовляем имя пациента в массив для рапорта доктора
    [self.sickOrgan addObject: patient.name];
    
}

// Рапорт доктора
- (void) raportBadDoctor {

    for (int i = 0; i < self.sickOrgan.count; i++) {
        NSLog(@"Patients who have a sick organs: %@", self.sickOrgan[i]);
    }
    
}

// У доктора начинается новый рабочий день
- (void) newWorkingDayBadDoctor {
    // Удаляем из массива всех пациентов
    [self.sickOrgan removeAllObjects];
}

@end
