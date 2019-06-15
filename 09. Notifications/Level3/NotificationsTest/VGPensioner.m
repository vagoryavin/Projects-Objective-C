//
//  VGPensioner.m
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGPensioner.h"
#import "VGGovernment.h"

@implementation VGPensioner

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //Регистрация в defaultCenter
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(pensionChangedNotification:)
                                                     name: VGGovernmentPensionDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(averagePriceChangedNotification:)
                                                     name: VGGovernmentAveragePriceDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(inflationChangedNotification:)
                                                     name: VGGovernmentInflationDidChangeNotification
                                                   object: nil];
        NSLog(@"Подписываюсь на нотификацию");
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector (didEnterBackgroundNotification:)
                                                     name: UIApplicationDidEnterBackgroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector (willResignActiveNotification:)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector (willEnterForegroundNotification:)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector (didBecomeActiveNotification:)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{   // Удаление регистрации в defaultCenter
    NSLog(@"Отписываюсь от нотификации");
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

# pragma mark - VGGovernmentNotification
    // Реализация методов указанных при регистрации в defaultCenter
- (void) pensionChangedNotification: (NSNotification*) notification {
    
    // Достаем из dictionary измененое значение pension по ключу VGGovernmentPensionUserInfoKey
    NSNumber* newPension = [notification.userInfo objectForKey: VGGovernmentPensionUserInfoKey];
    
    // Если пенсия увеличилась, то пенсионеры довольны
    if ((CGFloat)[newPension floatValue] > self.pension) {
        NSLog(@"Pensioners is happy");
    // иначе пенсионеры несчастиливы
    } else {
        NSLog(@"Pensioners is not happy");
    }
    
    // Устанавливаем в property pension новое значение, которое установило государство
    self.pension = (CGFloat)[newPension floatValue];
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    NSNumber* newAveragePrice = [notification.userInfo objectForKey: VGGovernmentAveragePriceUserInfoKey];
    
    if ((CGFloat)[newAveragePrice floatValue] > self.averagePrice) {
        NSLog(@"Pensioners is not happy");
    } else {
        NSLog(@"Pensioners is happy");
    }
    self.averagePrice = (CGFloat)[newAveragePrice floatValue];

}

- (void) inflationChangedNotification: (NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey: VGGovernmentInflationUserInfoKey];
    
    CGFloat inflation = [value floatValue];
    
    CGFloat costOfLiving = (CGFloat)(self.averagePrice / self.productForPension);
    
    if (inflation > costOfLiving) {
        NSLog(@"The goverment pension increase. So it is impossible to live!");
    } else {
        NSLog(@"Life is wonderful!");
    }
}

- (void) willResignActiveNotification: (NSNotification*) notification {
    NSLog(@"I go to sleep");
}

- (void) didEnterBackgroundNotification: (NSNotification*) notification {
    NSLog(@"I am sleeping");
}

- (void) willEnterForegroundNotification: (NSNotification*) notification {
    NSLog(@"I wake up");
}

- (void) didBecomeActiveNotification: (NSNotification*) notification {
    NSLog(@"I am working");
}

@end
