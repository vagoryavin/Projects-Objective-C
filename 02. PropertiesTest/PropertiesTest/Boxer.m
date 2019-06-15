//
//  Boxer.m
//  PropertiesTest
//
//  Created by Горявин Владимир on 23.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "Boxer.h"

// Категория для инкапсуляции свойств
@interface Boxer ()
@property (assign, nonatomic) NSInteger nameCount;
@end


@implementation Boxer

@synthesize name = _name;

- (instancetype)init
{
    self = [super init];
    if (self) {
    // Инициализация свойств
        _nameCount = 0;
        self.name = @"Default";
        self.age = 1;
        self.height = 0.5f;
        self.weight = 5.f;
    }
    return self;
}

- (void) setName:(NSString *) name{
    _name = name;
    NSLog(@"setter setName: is called");
}

- (NSString*) name{
    _nameCount ++;
    NSLog(@"Name getter is called  %ld times", _nameCount);
    return _name;
}

- (NSInteger) age {
    NSLog(@"Age getter is called");
    return _age;
}

- (NSInteger) howOldAreYou{
    return _age;
}

@end
