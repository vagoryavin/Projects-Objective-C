//
//  Dog.m
//  Schoolboy
//
//  Created by Горявин Владимир on 06.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void) moveAnimal{
    NSLog(@"%@'s dog and %@ move", self.nickname, self.nickname);
}

#pragma mark - VGJumpers.h
- (void) jump {
    NSLog(@"%@ is jump. The length - %f and height - %f of jump.", self.nickname, self.lengthJump, self.heightJump);
}

#pragma mark - VGSwimmers.h
- (void) swim {
    NSLog(@"%@ is swim.", self.nickname);
}

- (void) dive {
    NSLog(@"%@ is dive. Time under water: %f", self.nickname, self.timeUnderWater);
}

- (void) crawl {
    NSLog(@"%@ is crawl.", self.nickname);
}

#pragma mark - VGRunners.h
- (void) run {
    NSLog(@"%@ is run. The speed - %f and acceleration - %f of run.", self.nickname, self.speed, self.acceleration);
}

- (void) walk {
    NSLog(@"%@ is walk", self.nickname);
}

@end
