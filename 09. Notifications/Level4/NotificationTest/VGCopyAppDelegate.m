//
//  VGCopyAppDelegate.m
//  NotificationTest
//
//  Created by Горявин Владимир on 11.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGCopyAppDelegate.h"
#import "AppDelegate.h"

@implementation VGCopyAppDelegate

# pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"VGCopyAppDelegate подписался на нотификации");
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(didFinishLaunchingNotification:)
                                                     name: UIApplicationDidFinishLaunchingNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(willResignActiveNotification:)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(didEnterBackgroundNotification:)
                                                     name: UIApplicationDidEnterBackgroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(willEnterForegroundNotification:)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(didBecomeActiveNotification:)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(willTerminateNotification:)
                                                     name: UIApplicationWillTerminateNotification
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"VGCopyAppDelegate отписался от рассылки нотификаций");

    [[NSNotificationCenter defaultCenter] removeObserver: self];
}


#pragma mark - Notifications

- (void) didFinishLaunchingNotification: (NSNotification*) notification {
    
    NSLog(@"VGCopyAppDelegate: application didFinishLaunchingWithOptions");
}

- (void) willResignActiveNotification: (NSNotification*) notification {
   
    NSLog(@"VGCopyAppDelegate: applicationWillResignActive");
}

- (void) didEnterBackgroundNotification: (NSNotification*) notification {
    
    NSLog(@"VGCopyAppDelegate: applicationDidEnterBackground");
}

- (void) willEnterForegroundNotification: (NSNotification*) notification {
    
    NSLog(@"VGCopyAppDelegate: applicationWillEnterForeground");
}

- (void) didBecomeActiveNotification: (NSNotification*) notification {
    
    NSLog(@"VGCopyAppDelegate: applicationDidBecomeActive");
}

- (void) willTerminateNotification: (NSNotification*) notification {
 
    NSLog(@"VGCopyAppDelegate: applicationWillTerminate");
}

@end
