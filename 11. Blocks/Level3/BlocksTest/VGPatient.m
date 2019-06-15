//
//  VGPatient.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGPatient.h"

@implementation VGPatient

- (BOOL) iGetSick: (void(^)(VGPatient*)) getSickBlock {
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        getSickBlock(self);
    }
    return iFeelGood;
}

@end



