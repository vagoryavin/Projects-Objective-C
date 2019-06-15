//
//  Dog.h
//  Schoolboy
//
//  Created by Горявин Владимир on 06.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Animal.h"
#import "VGJumpers.h"
#import "VGSwimmers.h"
#import "VGRunners.h"

@interface Dog : Animal <VGJumpers, VGSwimmers, VGRunners>

#pragma mark - VGJumpers.h
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;

#pragma mark - VGSwimmers.h
@property (assign, nonatomic) CGFloat timeUnderWater;

#pragma mark - VGRunners.h
@property (assign, nonatomic) CGFloat speed;
@property (assign, nonatomic) CGFloat acceleration;

- (void) run;
- (void) walk;

@end
