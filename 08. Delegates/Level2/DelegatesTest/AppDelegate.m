//
//  AppDelegate.m
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGPatient.h"
#import "VGDoctor.h"
#import "VGBadDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    VGPatient* patient1 = [[VGPatient alloc] init];
    patient1.name = @"Valdimir";
    patient1.surname = @"Valdimirov";
    patient1.temperature = 36.6f;
    patient1.headache = NO;
    patient1.soreThroat = NO;
    
    VGPatient* patient2 = [[VGPatient alloc] init];
    patient2.name = @"Alexander";
    patient2.surname = @"Alexandrov";
    patient2.temperature = 37.9f;
    patient2.headache = YES;
    patient2.soreThroat = NO;
    
    VGPatient* patient3 = [[VGPatient alloc] init];
    patient3.name = @"Dmitry";
    patient3.surname = @"Dmitrov";
    patient3.temperature = 39.0f;
    patient3.headache = YES;
    patient3.soreThroat = YES;
    
    VGPatient* patient4 = [[VGPatient alloc] init];
    patient4.name = @"Andrey";
    patient4.surname = @"Andreev";
    patient4.temperature = 40.f;
    patient4.headache = YES;
    patient4.soreThroat = YES;
    
    VGPatient* patient5 = [[VGPatient alloc] init];
    patient5.name = @"Egor";
    patient5.surname = @"Egorov";
    patient5.temperature = 37.0f;
    patient5.headache = NO;
    patient5.soreThroat = NO;
    
    VGBadDoctor* badDoctor = [[VGBadDoctor alloc] init];
    badDoctor.name = @"Dr.Bykov";
    patient1.delegate = badDoctor;
    patient2.delegate = badDoctor;
    patient3.delegate = badDoctor;

    VGDoctor* doctor = [[VGDoctor alloc] init];
    doctor.name = @"Dr.House";
    patient4.delegate = doctor;
    patient5.delegate = doctor;
    
    NSArray* arrayPatients = [[NSArray alloc] initWithObjects: patient1, patient2, patient3, patient4, patient5, nil];

    for (VGPatient* patient in arrayPatients) {
        NSLog(@"You feel good?");
        NSLog(@"%@ %@: I feel %s.", patient.name, patient.surname, [patient iGetSick] ? "Good" : "Bad");
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
