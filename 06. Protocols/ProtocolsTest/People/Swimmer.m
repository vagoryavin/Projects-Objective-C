//
//  Swimmer.m
//  Schoolboy
//
//  Created by Горявин Владимир on 31.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Swimmer.h"

@implementation Swimmer

- (void) move{
    NSLog(@"%@ move", self.name);
}

- (void) swim {
    NSLog(@"%@ is swim", self.name);
}

- (void) dive {
    NSLog(@"%@ is dive. Time under water: %f.", self.name, self.timeUnderWater);
}

@end
