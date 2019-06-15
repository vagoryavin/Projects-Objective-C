//
//  VGDoctor.m
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGDoctor.h"
#import "VGGovernment.h"

@implementation VGDoctor

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(salaryChangedNotification:)
                                                     name: VGGovernmentSalaryDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector: @selector(averagePriceChangedNotification:)
                                                     name: VGGovernmentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - VGGovernmentNotification
- (void) salaryChangedNotification: (NSNotification*) notification {
    
    NSNumber* newSalary = [notification.userInfo objectForKey: VGGovernmentSalaryUserInfoKey];
    
    if ((CGFloat)[newSalary floatValue] > self.salary) {
        NSLog(@"Doctors is happy");
    } else {
        NSLog(@"Doctors is not happy");
    }
    self.salary = (CGFloat)[newSalary floatValue];
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    NSNumber* newAveragePrice = [notification.userInfo objectForKey: VGGovernmentAveragePriceUserInfoKey];
    
    if ((CGFloat)[newAveragePrice floatValue] > self.averagePrice) {
        NSLog(@"Doctors is not happy");
    } else {
        NSLog(@"Doctors is  happy");
    }
    self.averagePrice = (CGFloat)[newAveragePrice floatValue];
}

@end
