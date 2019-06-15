//
//  Swimmer.h
//  Schoolboy
//
//  Created by Горявин Владимир on 31.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Human.h"
#import "VGSwimmers.h"

@interface Swimmer : Human <VGSwimmers>

@property (assign, nonatomic) CGFloat timeUnderWater;

@end
