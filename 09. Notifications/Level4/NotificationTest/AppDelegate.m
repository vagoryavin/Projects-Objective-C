//
//  AppDelegate.m
//  NotificationTest
//
//  Created by Горявин Владимир on 11.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGCopyAppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) VGCopyAppDelegate* appDelegateCopy;

@end

@implementation AppDelegate

/*
 1. Нажимаем кнопку HOUME;
 2. UIApplication "понимает" что пора сворачиваться;
 3. UIApplication посылает сообщение (вызывает метод willResignActive) своему делегату (AppDelegate), о том что сейчас оно свернется;
 4. UIApplication делает рассылку через UINotificationCenter точно такой же нотификации (willResignActive), как бы дублируя, чтобы другие классы не ссылались на AppDelegate, но могли не зависимо от него обработать это событие.
 
    Итог: Раньше вызывается метод делегата, а затем уже нотификация.
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.appDelegateCopy = [[VGCopyAppDelegate alloc] init];

    NSLog(@"application didFinishLaunchingWithOptions");
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    NSLog(@"applicationWillResignActive");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"applicationDidEnterBackground");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"applicationWillEnterForeground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSLog(@"applicationDidBecomeActive");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSLog(@"applicationWillTerminate");
}

@end
