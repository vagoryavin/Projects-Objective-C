//
//  Bird.m
//  Schoolboy
//
//  Created by Горявин Владимир on 06.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Bird.h"

@implementation Bird

- (void) moveAnimal{
    NSLog(@"%@'s bird and %@ move", self.nickname, self.nickname);
}

#pragma mark - VGJumpers.h
- (void) jump {
    NSLog(@"%@ is jump", self.nickname);
}

- (void) fly {
    NSLog(@"%@ is fly", self.nickname);
}

#pragma mark - VGRunners.h
- (void) run {
    NSLog(@"%@ is run", self.nickname);
}

- (void) walk {
    NSLog(@"%@ is walk", self.nickname);
}

@end
