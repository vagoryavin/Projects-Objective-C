//
//  Object.m
//  ParametersTest
//
//  Created by Горявин Владимир on 29.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Object.h"

@implementation Object

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"object is created");

    }
    return self;
}
- (void) dealloc {
    NSLog(@"object is dealocated");
}

- (id) copyWithZone:(NSZone *)zone{
    return [[Object alloc] init];
}

@end
