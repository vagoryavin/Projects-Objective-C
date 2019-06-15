//
//  VGJumpers.h
//  ProtocolsTest
//
//  Created by Горявин Владимир on 27.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VGJumpers <NSObject>

@required
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;

- (void) jump;

@optional
@property (assign, nonatomic) CGFloat timeJump;

- (void) fly;
- (void) run;

@end

