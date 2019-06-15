//
//  AppDelegate.m
//  ArraysTest
//
//  Created by Горявин Владимир on 31.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Cyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Child.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Human* human = [[Human alloc] init];
    human.name = @"human";
    human.height = 180.f;
    human.weight = 80.f;
    human.gender = genderMale;
    
    Cyclist* cyclist = [[Cyclist alloc] init];
    cyclist.name = @"cyclist";
    cyclist.height = 200.f;
    cyclist.weight = 90.f;
    cyclist.gender = genderMale;
    
    Runner* runner = [[Runner alloc] init];
    runner.name = @"runner";
    runner.height = 160.f;
    runner.weight = 45.f;
    runner.gender = genderFemale;
    
    Swimmer* swimmer = [[Swimmer alloc] init];
    swimmer.name = @"swimmer";
    swimmer.height = 160.f;
    swimmer.weight = 57.f;
    swimmer.gender = genderFemale;

    Child* child = [[Child alloc] init];
    child.lastName = @"Ivanov";
    child.language = @"Russian";
    
    NSArray* arrayPeople = [[NSArray alloc] initWithObjects: human, cyclist, runner, swimmer, child, nil];
    
    for (int i = (unsigned int)arrayPeople.count - 1; i>=0; i--) {
//      Human* human = [arrayPeople objectAtIndex:i];
        Human* human = arrayPeople[i];
        NSLog(@"____________________");
        NSLog(@"name: %@; height: %f; weight: %f; gender: %@", human.name, human.height, human.weight, human.gender ? @"Male" : @"Female");
       
        if([human isKindOfClass: [Child class]]){
            Child* child = (Child*) human;
            NSLog(@"lastName: %@ and language: %@", child.lastName, child.language);
        }
        [human move];
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
