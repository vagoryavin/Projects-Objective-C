//
//  VGStudentOperation.h
//  ThreadsTest
//
//  Created by Горявин Владимир on 20.12.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGStudentOperation : NSObject

@property(strong, nonatomic) NSString* name;

- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue;

@end

NS_ASSUME_NONNULL_END
