//
//  VGGovernment.h
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UiKit/UiKit.h>

// Объявления Notification
// extern - глобальная переменная, NSString* const указатель на не изменяемую строку.
extern NSString* const VGGovernmentTaxLevelDidChangeNotification;
extern NSString* const VGGovernmentSalaryDidChangeNotification;
extern NSString* const VGGovernmentPensionDidChangeNotification;
extern NSString* const VGGovernmentAveragePriceDidChangeNotification;
extern NSString* const VGGovernmentInflationDidChangeNotification;

// Обьявления глобальной переменной, котороя будет служить ключом в dictionary. Под эти ключом в dictionary будет храниться новое значение property.
extern NSString* const VGGovernmentTaxLevelUserInfoKey;
extern NSString* const VGGovernmentSalaryUserInfoKey;
extern NSString* const VGGovernmentPensionUserInfoKey;
extern NSString* const VGGovernmentAveragePriceUserInfoKey;
extern NSString* const VGGovernmentInflationUserInfoKey;

NS_ASSUME_NONNULL_BEGIN

@interface VGGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat inflation;

@end

NS_ASSUME_NONNULL_END
