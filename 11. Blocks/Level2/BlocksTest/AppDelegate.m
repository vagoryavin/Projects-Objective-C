//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Горявин Владимир on 19.10.2018.
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
    student1.name = @"Anastasia";
    student1.surname = @"Aleksandrova";
    
    VGStudent* student2 = [[VGStudent alloc] init];
    student2.name = @"Boris";
    student2.surname = @"Babushkin";
    
    VGStudent* student3 = [[VGStudent alloc] init];
    student3.name = @"Viktor";
    student3.surname = @"Vasilyev";
    
    VGStudent* student4 = [[VGStudent alloc] init];
    student4.name = @"Gennady";
    student4.surname = @"Vorobyov";
    
    VGStudent* student5 = [[VGStudent alloc] init];
    student5.name = @"Dmitry";
    student5.surname = @"Dudinsky";
    
    VGStudent* student6 = [[VGStudent alloc] init];
    student6.name = @"Yelena";
    student6.surname = @"Yeremeyeva";
    
    VGStudent* student7 = [[VGStudent alloc] init];
    student7.name = @"Pyotr";
    student7.surname = @"Vorobyov";
    
    VGStudent* student8 = [[VGStudent alloc] init];
    student8.name = @"Zhanna";
    student8.surname = @"Ilyina";
    
    VGStudent* student9 = [[VGStudent alloc] init];
    student9.name = @"Zoya";
    student9.surname = @"Aleksandrova";
    
    VGStudent* student10 = [[VGStudent alloc] init];
    student10.name = @"Irina";
    student10.surname = @"Ilyina";
    
   NSArray* arrayStudents = [[NSArray alloc] initWithObjects: student1, student2, student3, student5, student4, student6, student7, student8, student9, student10, nil];
    
    NSArray* sortedArrayStudents = [arrayStudents sortedArrayUsingComparator: ^NSComparisonResult(VGStudent* obj1, VGStudent* obj2) {
        
        if ([obj1.surname isEqualToString:obj2.surname]) {
            return [obj1.name compare:obj2.name];
        }
        return [obj1.surname compare:obj2.surname];
    }];
    
    NSLog(@"\nArray students:");
    for (VGStudent* student in arrayStudents) {
        NSLog(@"%@ %@", student.surname, student.name);
    }
    
    NSLog(@"\nSorted array students:");
    for (VGStudent* student in sortedArrayStudents) {
        NSLog(@"%@ %@", student.surname, student.name);
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
