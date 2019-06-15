//
//  VGBusinessman.m
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGBusinessman.h"
#import "VGGovernment.h"

@implementation VGBusinessman

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(taxLevelDidChangedNotification:) name:VGGovernmentTaxLevelDidChangeNotification
                                                   object:nil];
        
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

# pragma mark - VGGovernmentNotification
- (void) taxLevelDidChangedNotification: (NSNotification*) notification{
    
    NSNumber* newTaxLevel = [notification.userInfo objectForKey: VGGovernmentTaxLevelUserInfoKey];
    
    if ((CGFloat)[newTaxLevel floatValue] > self.taxLevel) {
        NSLog(@"Businessman is not happy");
    } else {
        NSLog(@"Businessman is happy");
    }
    
    self.averagePrice = (CGFloat)[newTaxLevel floatValue];
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    NSNumber* newAveragePrice = [notification.userInfo objectForKey: VGGovernmentAveragePriceUserInfoKey];
    
    if ((CGFloat)[newAveragePrice floatValue] > self.averagePrice) {
        NSLog(@"Businessmans is happy");
    } else {
        NSLog(@"Businessmans is not happy");
    }
    
    self.averagePrice = (CGFloat)[newAveragePrice floatValue];
    
}

@end
