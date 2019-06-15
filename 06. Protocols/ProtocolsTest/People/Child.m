//
//  Child.m
//  Schoolboy
//
//  Created by Горявин Владимир on 01.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Child.h"

@implementation Child

- (void) move{
    NSLog(@"Parent:");
    [super move];
    NSLog(@"Child move");
}

#pragma VGRunners.h
- (void) run {
    NSLog(@"%@ is run. Speed: %f; Acceleration: %f ", self.name, self.speed, self.acceleration);
}

- (void) walk {
    NSLog(@"%@ is walk", self.name);
}

#pragma mark VGJumpers.h
- (void) jump {
    NSLog(@"%@ is jump. The height - %f and length - %f of the jump.", self.name, self.heightJump, self.lengthJump);
}

@end
