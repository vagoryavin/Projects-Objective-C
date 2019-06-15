//
//  VGPatient.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGPatient.h"

@implementation VGPatient

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self performSelector: @selector(iGetSick)
                   withObject: nil
                   afterDelay: 5];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"I am deallocated");
}

- (BOOL) iGetSick {
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        self.blockPatient();
    }
    return iFeelGood;
}

@end



