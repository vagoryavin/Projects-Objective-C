//
//  VGDoctor.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGDoctor.h"

@interface VGDoctor()

@property (assign , nonatomic) BOOL patientIsOK; // оценка тяжести заболвания
@property (strong, nonatomic) NSMutableArray* sickHead; // массив пациентов, котрые жалуются на боль в голове
@property (strong, nonatomic) NSMutableArray* sickBody; // массив пациентов, котрые жалуются на боль в теле
@property (strong, nonatomic) NSMutableArray* sickArmAndFoot; // массив пациентов, котрые жалуются на боль в руках или ногах

@end

@implementation VGDoctor

- (instancetype)init {
    self = [super init];
    if (self) {
        // иницилизируем массивы
        self.sickHead = [NSMutableArray array];
        self.sickBody = [NSMutableArray array];
        self.sickArmAndFoot = [NSMutableArray array];
    }
    return self;
}

#pragma mark - VGPatientDelegate.h

// Пациент пришел со своей болезнью
- (void) patientFeelsBad: (VGPatient *) patient {
    
    NSLog(@"Hello! My name is %@. I am your doctor.", self.name);
    
    // Если у пациента температура в пределах (36.6; 38], пациенту дается таблетка
    if (patient.temperature > 36.6f && patient.temperature <= 38.f ) {
        NSLog(@"Patient: %@ %@ needs to take a pill", patient.name, patient.surname);
        
        // если еще у пациента болит голова или горло, ему делается укол
        if (patient.isHeadache || patient.isSoreThroat) {
            NSLog(@"Patient: %@ %@ needs to make a shot", patient.name, patient.surname);
        }
        
        self.patientIsOK = YES; // у пациента с данными признаками болезни, тяжесть заболевания несерьезная
    
    // Если у пациента температура в пределах (38; 39.9], пациенту делается укол
    } else if (patient.temperature > 38.f && patient.temperature <= 39.9f) {
        NSLog(@"Patient: %@ %@ needs to make a shot", patient.name, patient.surname);
        
        // если еще у пациента болит голова или горло, его надо госпитализировать
        if (patient.isHeadache || patient.isSoreThroat) {
            NSLog(@"Patient: %@ %@ needs to be hospitalized", patient.name, patient.surname);
        }
        
        self.patientIsOK = NO; // у пациента с данными признаками болезни, тяжесть заболевания серьезная
        
    // Если у пациента температура выше 39.9, пациента срочно надо госпитализировать
    } else if (patient.temperature > 39.9f) {
        NSLog(@"Patient: %@ %@ needs to be hospitalized urgently", patient.name, patient.surname);
        self.patientIsOK = NO; // у пациента с данными признаками болезни, тяжесть заболевания серьезная
    
    // Иначе температура пациента в пределах норма и ему надо раслабиться
    } else {
        NSLog(@"Patient: %@ %@ needs relaxation", patient.name, patient.surname);
        self.patientIsOK = YES; // у пациента с данными признаками болезни, тяжесть заболевания несерьезная
    }
    
}

// Пациент задает вопрос доктору
- (void) patient: (VGPatient *) patient hasQuestion: (NSString *) question {
    NSLog(@"Patient %@ asks: %@", patient.surname, question);
    
    // На основании своего лечения доктор делает вывод, что тяжесть заболевания пациента серьезная и его надо госпитализировать
    if (!self.patientIsOK) {
        NSLog(@"You have a serious sickness. You need hospitalization.");
        
    // На основании своего лечения доктор делает вывод, что тяжесть заболевания пациента несерьезная
    } else {
        NSLog(@"That is all right. Don't worry.");
    }
}

// Пацент обращается к доктору с болью в какой-то части тела
- (void) patient:(VGPatient *)patient hasTrouble:(BodyPart) organ {
    
    // У пациента болит горло, ему надо дать таблетку
    if (patient.organ == head) {
        NSLog(@"Patient: %@ %@ needs to take a pill", patient.name, patient.surname);
        // записываем пацента в массив больных у которых болит голова
        [self.sickHead addObject: patient.name];
        
    // У пациента болит тело, ему надо сделать укол
    } else if (patient.organ == body) {
        NSLog(@"Patient: %@ %@ needs to make a shot", patient.name, patient.surname);
        // записываем пацента в массив больных у которых болит тело
        [self.sickBody addObject: patient.name];

    // У пацента болят руки или ноги, ему надо наложить гипс
    } else if (patient.organ == leftArm || patient.organ == rightArm
               || patient.organ == leftFoot || patient.organ == rightFoot){
        NSLog(@"Patient: %@ %@ needs a cast", patient.name, patient.surname);
        // записываем пацента в массив больных у которых болит руки или ноги
        [self.sickArmAndFoot addObject: patient.name];
        
    // Пациенты у которых ничего не болит
    } else {
        NSLog(@"Patient: %@ %@ does not sick anything", patient.name, patient.surname);
    }
    
}

// Рапорт доктора, в котором пациенты деляться по больным частям тела
- (void) raportDoctor {
    
    // Пациенты у которых болит горло
    if (self.sickHead.count > 0) {
        NSLog(@"Patients who have a sick head:");
        for (int i = 0; i < self.sickHead.count; i++) {
            NSLog(@"%@", self.sickHead[i]);
        }
    }
    
    // Пациенты у которых болит тело
    if (self.sickBody.count > 0) {
        NSLog(@"Patients who have a sick body:");
        for (int i = 0; i < self.sickBody.count; i++) {
            NSLog(@"%@", self.sickBody[i]);
        }
    }
    
    // Пациенты у которых болит руки или ного
    if (self.sickArmAndFoot.count > 0) {
        NSLog(@"Patients who have a sick arm or foot:");
        for (int i = 0; i < self.sickArmAndFoot.count; i++) {
            NSLog(@"%@", self.sickArmAndFoot[i]);
        }
    }
    
}

// У доктора начинается новый рабочий день
- (void) newWorkingDayDoctor {
    // Удаляем из массива всех пациентов
    [self.sickHead removeAllObjects];
    [self.sickBody removeAllObjects];
    [self.sickArmAndFoot removeAllObjects];
}

@end
