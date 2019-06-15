//
//  VGStudentOperation.m
//  ThreadsTest
//
//  Created by Горявин Владимир on 20.12.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGStudentOperation.h"

@implementation VGStudentOperation

#pragma mark - Level 4
/*----- Level 4: -----*/
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue {
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation* blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSInteger value;
        BOOL isNumberTrue = NO;
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@: search for the answer", self.name);
        while (!isNumberTrue) {
            
            // generate a number in range
            value = arc4random()% (endValue - startValue) + startValue;
            
            if (value == answer) {
                
                isNumberTrue = YES;
                
                NSLog(@"%@: I have answer - %ld, time - %f", self.name, value, CACurrentMediaTime() - startTime);
            }
        }
        
        NSLog(@"%@: search for the answer completed", self.name);
    }];
    
    [queue addOperation: blockOperation];
}
@end
