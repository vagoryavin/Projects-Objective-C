//
//  VGSwimmers.h
//  ProtocolsTest
//
//  Created by Горявин Владимир on 27.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VGSwimmers <NSObject>

@required
@property (assign, nonatomic) CGFloat timeUnderWater;

- (void) swim;
- (void) dive;

@optional
- (void) walk;
- (void) crawl;

@end
