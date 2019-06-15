//
//  Runner.m
//  Schoolboy
//
//  Created by Горявин Владимир on 31.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Runner.h"

@implementation Runner

- (void) move{
    NSLog(@"%@ move", self.name);
}

#pragma mark - VGRunners.h
- (void) run {
    NSLog(@"%@ is run. Speed: %f; Acceleration: %f ", self.name, self.speed, self.acceleration);
}

- (void) walk {
    NSLog(@"%@ is walk", self.name);
}

@end
