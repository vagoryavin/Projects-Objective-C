//
//  VGRunners.h
//  ProtocolsTest
//
//  Created by Горявин Владимир on 27.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VGRunners <NSObject>

@required
@property (assign, nonatomic) CGFloat speed;
@property (assign, nonatomic) CGFloat acceleration;

- (void) run;
- (void) walk;

@optional
- (void) fly;

@end

