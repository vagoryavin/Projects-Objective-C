//
//  VGPensioner.h
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UiKit/UiKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGPensioner : NSObject

@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) NSInteger productForPension;

- (void) willResignActiveNotification: (NSNotification*) notification;

@end

NS_ASSUME_NONNULL_END
