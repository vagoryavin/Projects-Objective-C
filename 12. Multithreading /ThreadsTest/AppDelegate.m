//
//  AppDelegate.m
//  ThreadsTest
//
//  Created by Горявин Владимир on 15.12.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSInteger startValue = 0, endValue = 100;
    NSInteger answer = arc4random()% (endValue - startValue) + startValue;
    
    VGStudent* student1 = [[VGStudent alloc] init];
    student1.name = @"Student1";
    
    VGStudent* student2 = [[VGStudent alloc] init];
    student2.name = @"Student2";
    
    VGStudent* student3 = [[VGStudent alloc] init];
    student3.name = @"Student3";
    
    VGStudent* student4 = [[VGStudent alloc] init];
    student4.name = @"Student4";
    
    VGStudent* student5 = [[VGStudent alloc] init];
    student5.name = @"Student5";
    
    NSArray* arrayStudents = [[NSArray alloc] initWithObjects: student1, student2, student3, student4, student5, nil];
    
    NSLog(@"Answer: %ld", answer);
    
#pragma mark - Level 1
/*----- Level 1:
    for (VGStudent* student in arrayStudents) {
        [student guessTheAnswer: answer and: startValue and: endValue];
    }
-----*/
    
#pragma mark - Level 2
/*----- Level 2:
    for (VGStudent* student in arrayStudents) {
        [student guessTheAnswer:answer and:startValue and:endValue and:^{
            
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            
            dispatch_async(queue, ^{
                
                NSInteger value;
                BOOL isNumberTrue = NO;
                double startTime = CACurrentMediaTime();
                
                NSLog(@"%@: search for the answer", student.name);
                
                while (!isNumberTrue) {
                    
                    // generate a number in range
                    value = arc4random()% (endValue - startValue) + startValue;
                    
                    if (value == answer) {
                        
                        isNumberTrue = YES;
                        
                        NSLog(@"%@: I have answer - %ld, time - %f", student.name, value, CACurrentMediaTime() - startTime);
                    }
                }
                
                NSLog(@"%@: search for the answer completed", student.name);
            });
        }];
    }
-----*/
  
#pragma mark - Level 3
/*----- Level 3:
    for (VGStudent* student in arrayStudents) {
        [student guessTheAnswer: answer and: startValue and: endValue];
    }
-----*/
    
#pragma mark - Level 4
/*----- Level 4: -----*/
    for (VGStudent* student in arrayStudents) {
        [student guessTheAnswer: answer and: startValue and: endValue];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
