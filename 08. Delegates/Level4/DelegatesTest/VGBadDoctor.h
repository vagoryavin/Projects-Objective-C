//
//  VGBadDoctor.h
//  DelegatesTest
//
//  Created by Горявин Владимир on 07.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VGPatient.h"

@interface VGBadDoctor : NSObject <VGPatientDelegate>

@property (strong, nonatomic) NSString* name;

- (void) raportBadDoctor;
- (void) newWorkingDayBadDoctor;

@end

