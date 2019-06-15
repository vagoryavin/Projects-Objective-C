//
//  Cat.m
//  Schoolboy
//
//  Created by Горявин Владимир on 06.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (void) moveAnimal{
    NSLog(@"%@'s cat and %@ move", self.nickname, self.nickname);
}

#pragma mark - VGJumpers.h
- (void) jump {
    NSLog(@"%@ is jump. The length - %f and height - %f of jump.", self.nickname, self.lengthJump, self.heightJump);
}

- (void) fly {
    NSLog(@"%@ is fly", self.nickname);
}

#pragma mark - VGRunners.h
- (void) run {
    NSLog(@"%@ is run. The speed - %f and acceleration - %f of run.", self.nickname, self.speed, self.acceleration);
}

- (void) walk {
    NSLog(@"%@ is walk", self.nickname);
}

@end
