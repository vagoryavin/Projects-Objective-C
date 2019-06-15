//
//  AppDelegate.m
//  SelectorsTest
//
//  Created by Горявин Владимир on 11.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /* Selector - указатель на метод */
   
    [self testMethod];
    
    SEL selector1 = @selector(testMethod);
    [self performSelector: selector1];
    
    SEL selector2 = @selector(testMethod:);
    [self performSelector: selector2 withObject: @"test string"];
    
    SEL selector3 = @selector(testMethod:parameter2:);
    [self performSelector: selector3 withObject: @"test string1" withObject: @"test string2"];

    // Вызов метод с задержкой по времени
    [self performSelector: selector1 withObject: nil afterDelay: 5.f];

    VGObject* object1 = [[VGObject alloc] init];
    
    SEL selector4 = @selector(testMethod);
    [self performSelector: selector4];
    [object1 performSelector: selector4];
    
    NSString* secret = [object1 performSelector: @selector(superSecretText)];
    NSLog(@"secret = %@", secret);
 
    // Строка из селектора
    NSString* string1 = NSStringFromSelector(selector1);
    
    // Селектор из строки
    SEL sel = NSSelectorFromString(string1);

    NSString* string2 = [self testMethodParametr1:2 parametr2:3.1f parametr3:5.5f];
    NSLog(@"string = %@", string2);
    
/*
    SEL selector = @selector(testMethodParametr1:parametr2:parametr3:);
    
    NSMethodSignature* signature = [AppDelegate instanceMethodSignatureForSelector:selector];
    
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature: signature];
    
    [invocation setTarget: self];
    [invocation setSelector:selector];
    NSInteger iVal = 2;
    CGFloat fVal = 3.1f;
    double dVal = 5.5f;
    
    NSInteger * p1 = &iVal;
    CGFloat * p2 = &fVal;
    double * p3 = &dVal;
    
    [invocation setArgument:p1 atIndex:2];
    [invocation setArgument:p2 atIndex:3];
    [invocation setArgument:p3 atIndex:4];
 
    [invocation invoke];
    
    __unsafe_unretained NSString* string = nil;
    [invocation getReturnValue:&string];
    NSLog(@"string = %@", string);
*/
    return YES;
}

- (void) testMethod {
    
    NSLog(@"Test method");
    
}

- (void) testMethod: (NSString*) string {
    
    NSLog(@"testMethod: %@", string);
    
}

- (void) testMethod: (NSString*) string1 parameter2: (NSString*) string2 {
    
    NSLog(@"testMethod string1: %@ string2: %@", string1, string2);
    
}

- (void) testMethodParametr1: (NSInteger) intValue {
    
    NSLog(@"testMethodParametr1: %ld", intValue);
    
}

- (NSString*) testMethodParametr1: (NSInteger) intValue parametr2: (CGFloat) floatValue parametr3: (double) doubleValue {
    

    return [NSString stringWithFormat: @"testMethodParametr1: %ld parametr2: %f parametr3: %f", intValue, floatValue, doubleValue];
    
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
