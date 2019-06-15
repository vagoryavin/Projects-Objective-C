//
//  Child.h
//  Schoolboy
//
//  Created by Горявин Владимир on 01.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Human.h"
#import "VGRunners.h"
#import "VGJumpers.h"

@interface Child : Human <VGJumpers>

@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* language;

#pragma mark VGJumpers.h
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;

@end
