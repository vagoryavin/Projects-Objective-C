//
//  AppDelegate.m
//  ProtocolsTest
//
//  Created by Горявин Владимир on 26.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Child.h"
#import "Cyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Animal.h"
#import "Bird.h"
#import "Cat.h"
#import "Dog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Human* human = [[Human alloc] init];
    human.name = @"Human";
    human.height = 1.8f;
    human.weight = 80.f;
    human.gender = genderMale;
    human.speed = 15.f;
    human.acceleration = 9.8f;
    
    Child* child = [[Child alloc] init];
    child.name = @"Child";
    child.lastName = @"Human";
    child.language = @"Russian";
    child.height = 0.5f;
    child.weight = 3.9f;
    child.gender = genderFemale;
    child.heightJump = 0.2f;
    child.lengthJump = 0.3f;
    child.speed = 5.f;
    child.acceleration = 1.f;
    
    Cyclist* cyclist = [[Cyclist alloc] init];
    cyclist.name = @"Cyclist";
    cyclist.height = 1.6f;
    cyclist.weight = 50.f;
    cyclist.gender = genderMale;
    cyclist.speed = 30.f;
    cyclist.acceleration = 20.f;
    
    Runner* runner = [[Runner alloc] init];
    runner.name = @"Runner";
    runner.height = 1.5f;
    runner.weight = 40.f;
    runner.gender = genderFemale;
    runner.speed = 44.f;
    runner.acceleration = 5.f;
    
    Swimmer* swimmer = [[Swimmer alloc] init];
    swimmer.name = @"Swimmer";
    swimmer.height = 2.0f;
    swimmer.weight = 85.f;
    swimmer.gender = genderMale;
    swimmer.speed = 30.f;
    swimmer.acceleration = 3.f;
    swimmer.timeUnderWater = 5.f;
    
    Animal* animal = [[Animal alloc] init];
    animal.nickname = @"Animal";
    animal.age = 3;
    
    Bird* bird = [[Bird alloc] init];
    bird.nickname = @"Bird";
    bird.age = 2;
    bird.heightJump = 0.7f;
    bird.lengthJump = 0.6f;
    bird.speed = 10.f;
    bird.acceleration = 2.f;
    bird.timeJump = 1.f;
    
    Cat* cat = [[Cat alloc] init];
    cat.nickname = @"Cat";
    cat.age = 5;
    cat.heightJump = 1.f;
    cat.lengthJump = 1.f;
    cat.speed = 30.f;
    cat.acceleration = 10.f;
    
    Dog* dog = [[Dog alloc] init];
    dog.nickname = @"Dog";
    dog.age = 4;
    dog.heightJump = 0.9f;
    dog.lengthJump = 0.8f;
    dog.speed = 40.f;
    dog.acceleration = 11.f;
    dog.timeUnderWater = 3.f;
    
    NSArray* arrayLivingBeing = [[NSArray alloc] initWithObjects: human, child, cyclist, runner, swimmer, animal, bird, cat, dog, nil];
    
    for (id <VGJumpers, VGRunners, VGSwimmers> object in arrayLivingBeing) {
        
        BOOL prVGJumpers = [object conformsToProtocol:@protocol (VGJumpers)];
        BOOL prVGRunners = [object conformsToProtocol:@protocol (VGRunners)];
        BOOL prVGSwimmers = [object conformsToProtocol:@protocol (VGSwimmers)];
        
        if ((prVGJumpers || prVGRunners || prVGSwimmers) == YES) { // Условие поддерживает ли объект протокол
            
            if ([object isKindOfClass:[Human class]]) { // Является ли объект Human
                
                Human* human = object;
                NSLog(@"--Human-- Name: %@\n Characteristics: height - %f;\n weight - %f;\n gender - %s;\n speed - %f;\n acceleration - %f.", human.name, human.height, human.weight, human.gender ? "Female" : "Male", human.speed, human.acceleration);
                
                if ([object isKindOfClass:[Child class]]) { // Является ли объект Child
                    
                    Child* child = object;
                    NSLog(@"Additional сharacteristics: lastName - %@; language - %@.", child.lastName, child.language);
                }
               
                [human move];
                
            } else if ([object isKindOfClass:[Animal class]]) { // Является ли объект Animal
                
                Animal* animal = object;
                
                NSLog(@"--Animal-- Nickname: %@; Age: %ld", animal.nickname, animal.age);
                [animal moveAnimal];
            }

            // Проверка для выполнения свойства не входящие в некоторые классы
            if([object respondsToSelector: @selector (timeJump)]){
                NSLog(@"Time jump: %f", object.timeJump);
            }
            
            // Проверка для выполнения методов не входящие в некоторые классы
            if([object respondsToSelector: @selector (jump)]){
               [object jump];
            }
            if ([object respondsToSelector: @selector (fly)]){
                [object fly];
            }
            if ([object respondsToSelector: @selector (run)]){
                [object run];
            }
            if ([object respondsToSelector: @selector (swim)]){
                [object swim];
            }
            if ([object respondsToSelector: @selector (dive)]){
                [object dive];
            }
            if ([object respondsToSelector: @selector (walk)]){
                [object walk];
            }
            if ([object respondsToSelector: @selector (crawl)]){
                [object crawl];
            }
        } else {
            NSLog(@"The object is not subscribed to the Protocols!!!");
        }
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
