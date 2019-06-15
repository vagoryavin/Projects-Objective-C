//
//  VGPatient.h
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VGPatientDelegate;

@interface VGPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic, getter = isHeadache) BOOL headache;
@property (assign, nonatomic, getter = isSoreThroat) BOOL soreThroat;
@property (weak, nonatomic)   id <VGPatientDelegate> delegate;

- (BOOL) iGetSick;

@end

@protocol VGPatientDelegate <NSObject>
@required
- (void) patientFeelsBad: (VGPatient *) patient;
- (void) patient: (VGPatient *) patient hasQuestion: (NSString *) question;

@end

