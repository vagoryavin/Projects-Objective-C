//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Горявин Владимир on 19.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGPatient.h"

@interface AppDelegate ()

//@property (strong, nonatomic) NSArray* arrayStudents;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    VGPatient* student1 = [[VGPatient alloc] init];
    student1.name = @"Vladimir";
    student1.temperature = 36.6;
    
    VGPatient* student2 = [[VGPatient alloc] init];
    student2.name = @"Petr";
    student2.temperature = 37.f;
    
    VGPatient* student3 = [[VGPatient alloc] init];
    student3.name = @"Dmitriy";
    student3.temperature = 39.f;
    
    VGPatient* student4 = [[VGPatient alloc] init];
    student4.name = @"Egor";
    student4.temperature = 40.f;
    
    NSArray* arrayStudents = [[NSArray alloc] initWithObjects:student1, student2, student3, student4, nil];
    
    for (__weak VGPatient* patient in arrayStudents) {
        
        patient.blockPatient = ^{
            
            if (patient.temperature > 36.6 && patient.temperature <= 38.f ) {
                NSLog(@"Patient: %@ needs to take a pill", patient.name);
                
            } else if (patient.temperature > 38.f && patient.temperature <= 39.9) {
                NSLog(@"Patient: %@ needs to make a shot", patient.name);
                
            } else if (patient.temperature > 39.9) {
                NSLog(@"Patient: %@ needs to be hospitalized urgently", patient.name);
                
            } else {
                NSLog(@"Patient: %@ needs relaxation", patient.name);
            }
            return patient;
        };
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
