//
//  ParentClass.m
//  FunctionsTest
//
//  Created by Горявин Владимир on 22.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "ParentClass.h"

@implementation ParentClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"INIT");
    }
    return self;
}


+ (void) whoAreYou{
    NSLog(@"I'm ParentClass");
}


+ (void) whoAreYou: (NSString*) string{
    NSLog(@"%@", string);
}


- (void) sayHello {
    NSLog(@"Parent says hello! %@", [self saySomeNumberString]);
}


- (void) say: (NSString*) string {
    NSLog(@"%@", string);
}


- (void) say: (NSString*) string1 and: (NSString*) string2 {
    NSLog(@"%@, %@", string1, string2);
}


- (NSString*) saySomething {
    NSString * string;
    string = @"I won't say anything";
    return string;
}


- (NSString*) saySomeNumberString{
    return [NSString stringWithFormat: @"%@", [NSDate date]];
}

@end
