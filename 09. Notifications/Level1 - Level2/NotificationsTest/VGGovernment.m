//
//  VGGovernment.m
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGGovernment.h"

NSString* const VGGovernmentTaxLevelDidChangeNotification = @"VGGovernmentTaxLevelDidChangeNotification";
NSString* const VGGovernmentSalaryDidChangeNotification = @"VGGovernmentSalaryDidChangeNotification";
NSString* const VGGovernmentPensionDidChangeNotification = @"VGGovernmentPensionDidChangeNotification";
NSString* const VGGovernmentAveragePriceDidChangeNotification = @"VGGovernmentAveragePriceDidChangeNotification";
NSString* const VGGovernmentInflationDidChangeNotification = @"VGGovernmentInflationDidChangeNotification";

NSString* const VGGovernmentTaxLevelUserInfoKey = @"VGGovernmentTaxLevelUserInfoKey";
NSString* const VGGovernmentSalaryUserInfoKey = @"VGGovernmentSalaryUserInfoKey";
NSString* const VGGovernmentPensionUserInfoKey = @"VGGovernmentPensionUserInfoKey";
NSString* const VGGovernmentAveragePriceUserInfoKey = @"VGGovernmentAveragePriceUserInfoKey";
NSString* const VGGovernmentInflationUserInfoKey = @"VGGovernmentInflationUserInfoKey";


@implementation VGGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 1000.f;
        self.pension = 500.f;
        self.averagePrice = 10.f;
        self.inflation = 2.36;
    }
    return self;
}

// При изменении taxLevel посылается нотификация в NotificationCenter с именем VGGovernmentTaxLevelDidChangeNotification и userInfo в виде dictionary.
- (void) setTaxLevel:(CGFloat)taxLevel {
    
    _taxLevel = taxLevel;
    
    // Dictionary в котором по ключу: VGGovernmentTaxLevelUserInfoKey хранится новое значение свойства taxLevel
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat:taxLevel] forKey:VGGovernmentTaxLevelUserInfoKey];
    
    // Отправка нотификации в NotificationCenter
    [[NSNotificationCenter defaultCenter] postNotificationName:VGGovernmentTaxLevelDidChangeNotification // имя нотификации
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) setSalary:(CGFloat)salary {
    
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat:salary] forKey:VGGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VGGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat:pension] forKey:VGGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VGGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat:averagePrice] forKey:VGGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VGGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setInflation:(CGFloat)inflation {
    
    _inflation = inflation;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat: inflation] forKey:VGGovernmentInflationUserInfoKey];
                                   
    [[NSNotificationCenter defaultCenter] postNotificationName: VGGovernmentInflationDidChangeNotification
                                                         object: nil
                                                       userInfo:dictionary];
}

@end
