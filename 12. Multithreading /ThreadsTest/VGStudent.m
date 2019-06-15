//
//  VGStudent.m
//  ThreadsTest
//
//  Created by Горявин Владимир on 15.12.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGStudent.h"

@implementation VGStudent

#pragma mark - Level 1
/*----- Level 1:
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
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
    });
}
-----*/


#pragma mark - Level 2
/*----- Level 2:
- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue and: (void (^)(void)) resultsBlock{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        resultsBlock();
    });
}
-----*/


#pragma mark - Level 3
/*----- Level 3:
+ (dispatch_queue_t) sharedInstance {
    static dispatch_once_t onceToken;
    static dispatch_queue_t queueConcurrent;
    
    dispatch_once(&onceToken, ^{
        
        queueConcurrent = dispatch_queue_create("com.vg.queueConcurrent", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return queueConcurrent;
}


- (void) guessTheAnswer: (NSInteger) answer and: (NSInteger) startValue and: (NSInteger) endValue {
    
    dispatch_async([VGStudent sharedInstance], ^{
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
    });
}
-----*/


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


- (void)dealloc{
    
    NSLog(@"%@: I am deallocated", self.name);
}

@end
