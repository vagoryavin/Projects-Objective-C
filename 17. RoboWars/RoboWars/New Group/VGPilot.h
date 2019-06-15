//
//  VGPilot.h
//  RoboWars
//
//  Created by Горявин Владимир on 29.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWPilot.h"

NS_ASSUME_NONNULL_BEGIN

@interface VGPilot : NSObject <RWPilot>

@property (assign, nonatomic) CGRect robotRect;
@property (assign, nonatomic) CGSize fieldSize;

@end

NS_ASSUME_NONNULL_END
