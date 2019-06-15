//
//  AppDelegate.m
//  DataTypesTest
//
//  Created by Горявин Владимир on 18.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "Car.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

// Task 1
    Car* renault = [[Car alloc] init];
    renault.brand = @"renault";
    renault.transmission = AutomaticTransmission;
    
    Car* lada = [[Car alloc] init];
    lada.brand = @"lada";
    lada.transmission = ManualTransmission;
    
    Car* volkswagen = [[Car alloc] init];
    volkswagen.brand = @"volkswagen";
    volkswagen.transmission = arc4random()%2;
    
    NSArray* arrayCar = [[NSArray alloc] initWithObjects: renault, lada, volkswagen, nil];

    for(Car* car in arrayCar){
        NSLog(@"brand: %@; transmission: %@; colour: %@", car.brand, car.transmission ? @"AutomaticTransmission" : @"ManualTransmission", [car whatColour]);
    }
    
// Task 2
    NSMutableArray* arrayPoint = [[NSMutableArray alloc] init];
    
    CGRect rect = CGRectMake(3, 3, 3, 3);
    
    int hit = 0, miss = 0;
    
    for (int i=0; i<10; i++) {
        CGPoint point = CGPointMake(arc4random()%11, arc4random()%11);
        [arrayPoint addObject:[NSValue valueWithCGPoint:point]];
    }
    
    for (NSValue* value in arrayPoint) {
        
        CGPoint point = [value CGPointValue];
        
        if(CGRectContainsPoint(rect, point)) {
            
            NSLog(@"Попадание: %@", NSStringFromCGPoint(point));
            hit++;
        } else {
            
            NSLog(@"Промах: %@", NSStringFromCGPoint(point));
            miss++;
        }
    }
    
    NSLog(@"Всего попаданий: %d / Всего промахов: %d", hit, miss);
    
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
