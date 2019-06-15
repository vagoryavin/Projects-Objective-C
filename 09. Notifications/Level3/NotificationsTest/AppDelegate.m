//
//  AppDelegate.m
//  NotificationsTest
//
//  Created by Горявин Владимир on 09.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGPensioner.h"
#import "VGGovernment.h"
#import "VGDoctor.h"
#import "VGBusinessman.h"

@interface AppDelegate ()

@property (strong, nonatomic) VGGovernment* goverment;
@property (strong, nonatomic) VGPensioner* pensioner;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.goverment = [[VGGovernment alloc] init];
    
    self.pensioner = [[VGPensioner alloc] init];
    VGBusinessman* businessman = [[VGBusinessman alloc] init];
    VGDoctor* doctor = [[VGDoctor alloc] init];
    
    self.pensioner.averagePrice = businessman.averagePrice = doctor.averagePrice = self.goverment.averagePrice;
    self.pensioner.pension = self.goverment.pension;
    self.pensioner.productForPension = 10;
    businessman.taxLevel = self.goverment.taxLevel;
    doctor.salary = self.goverment.salary;
    
    NSLog(@"The government has decided to increase: ");
    NSLog(@"----- tax level -----");
    self.goverment.taxLevel = 10.f;
    
    NSLog(@"----- salary -----");
    self.goverment.salary = 1500.f;
    
    NSLog(@"----- pension -----");
    self.goverment.pension = 1000.f;
    
    NSLog(@"----- average price -----");
    self.goverment.averagePrice = 15.f;
    
    NSLog(@"----- inflation -----");
    self.goverment.inflation = 3.f;

    NSLog(@"----- reduce inflation -----");
    self.goverment.inflation = 1.4;
    
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
