//
//  VGStudent.h
//  ThreadsTest
//
//  Created by Горявин Владимир on 15.12.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGStudent : NSObject

@property(strong, nonatomic) NSString* name;

/*----- Level 1:
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue;
-----*/

/*----- Level 2:
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue and: (void (^)(void)) resultsBlock;
-----*/

/*----- Level 3:
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue;
-----*/

/*----- Level 4: -----*/
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue;

@end

NS_ASSUME_NONNULL_END
