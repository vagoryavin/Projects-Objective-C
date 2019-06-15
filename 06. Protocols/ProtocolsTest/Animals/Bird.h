//
//  Bird.h
//  Schoolboy
//
//  Created by Горявин Владимир on 06.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Animal.h"
#import <UIKit/UIKit.h>
#import "VGJumpers.h"
#import "VGRunners.h"

@interface Bird : Animal <VGJumpers, VGRunners>

#pragma mark - VGJumpers.h
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;
@property (assign, nonatomic) CGFloat timeJump;

#pragma mark - VGRunners.h
@property (assign, nonatomic) CGFloat speed;
@property (assign, nonatomic) CGFloat acceleration;

@end
