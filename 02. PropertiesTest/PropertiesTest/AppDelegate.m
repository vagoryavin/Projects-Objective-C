//
//  AppDelegate.m
//  PropertiesTest
//
//  Created by Горявин Владимир on 23.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "Boxer.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Boxer* boxer = [[Boxer alloc] init];
/*
    boxer.name = @"Vasiliy";
    boxer.age = 25;
    boxer.height = 1.8f;
    boxer.weight = 80.f;
*/
    [boxer setName: @"Vasiliy"];
    [boxer setAge: 25];
    [boxer setHeight: 1.8f];
    [boxer setWeight: 80.f];
    
//  NSLog(@"\n name = %@\n age = %ld\n height = %f\n weight = %f\n", [boxer name], [boxer age], [boxer height], [boxer weight]);

    for (int i=0; i<=5; i++){
        NSLog(@" name = %@", [boxer name]);
    }
    
    NSLog(@"My age is %ld", [boxer howOldAreYou]);
    
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
