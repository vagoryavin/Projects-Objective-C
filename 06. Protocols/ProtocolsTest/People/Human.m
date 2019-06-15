//
//  Human.m
//  Schoolboy
//
//  Created by Горявин Владимир on 31.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Human.h"

@implementation Human

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"human";
        self.height = 0.0f;
        self.weight = 0.0f;
        self.gender = arc4random()%2;
    }
    return self;
}

- (void) move {
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
