//
//  VGPatient.h
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    head,
    leftArm,
    rightArm,
    body,
    leftFoot,
    rightFoot
} BodyPart;

typedef enum {
    negative,
    positive
} Assessment;

@protocol VGPatientDelegate;

@interface VGPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic, getter = isHeadache) BOOL headache;
@property (assign, nonatomic, getter = isSoreThroat) BOOL soreThroat;
@property (weak, nonatomic)   id <VGPatientDelegate> delegate;
@property (assign, nonatomic) BodyPart organ;
@property (assign, nonatomic) Assessment assessment;

- (BOOL) iGetSick;

@end

@protocol VGPatientDelegate <NSObject>
@required
- (void) patientFeelsBad: (VGPatient *) patient;
- (void) patient: (VGPatient *) patient hasQuestion: (NSString *) question;
- (void) patient: (VGPatient *) patient hasTrouble: (BodyPart) organ;

@end

