//
//  AppDelegate.h
//  ParametersTest
//
//  Created by Горявин Владимир on 29.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Object;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (copy, nonatomic) Object* object;  

@end

