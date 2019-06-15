//
//  AppDelegate.m
//  DictionaryTest
//
//  Created by Горявин Владимир on 28.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    VGStudent* student1 = [[VGStudent alloc] init];
    student1.name = @"Vladimir";
    student1.surname = @"Vladimirov";
    
    VGStudent* student2 = [[VGStudent alloc] init];
    student2.name = @"Alexander";
    student2.surname = @"Alexandrov";

    VGStudent* student3 = [[VGStudent alloc] init];
    student3.name = @"Andrey";
    student3.surname = @"Andreev";

    VGStudent* student4 = [[VGStudent alloc] init];
    student4.name = @"Dmitriy";
    student4.surname = @"Dmitriev";
    
    VGStudent* student5 = [[VGStudent alloc] init];
    student5.name = @"Egor";
    student5.surname = @"Egorov";

    VGStudent* student6 = [[VGStudent alloc] init];
    student6.name = @"Catherina";
    student6.surname = @"Petrova";

    VGStudent* student7 = [[VGStudent alloc] init];
    student7.name = @"Anastasiya";
    student7.surname = @"Ivanova";

    VGStudent* student8 = [[VGStudent alloc] init];
    student8.name = @"Julia";
    student8.surname = @"Pavlova";

    VGStudent* student9 = [[VGStudent alloc] init];
    student9.name = @"Lisa";
    student9.surname = @"Sergeeva";

    VGStudent* student10 = [[VGStudent alloc] init];
    student10.name = @"Ksenia";
    student10.surname = @"Grigorieva";

    // Level 1
    NSDictionary* gradebook = [[NSDictionary alloc] initWithObjectsAndKeys:
                               student1, [student1 studentID],
                               student2, [student2 studentID],
                               student3, [student3 studentID],
                               student4, [student4 studentID],
                               student5, [student5 studentID],
                               student6, [student6 studentID],
                               student7, [student7 studentID],
                               student8, [student8 studentID],
                               student9, [student9 studentID],
                               student10, [student10 studentID],
                               nil];

    NSLog(@"%@", gradebook);
    
    // Level 2
    for (NSString* key in [gradebook allKeys]) {
        VGStudent* student = [gradebook objectForKey: key];
        NSLog(@"%@: ", key);
        [student sayHello];
    }
    
    // Level 3
    NSArray* sortedKeys = [[gradebook allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString* key in sortedKeys) {
        VGStudent* student = [gradebook objectForKey: key];
        NSLog(@"%@:\n", key);
        [student sayHello];
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
