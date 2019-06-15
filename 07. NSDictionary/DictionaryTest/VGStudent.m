//
//  VGStudent.m
//  DictionaryTest
//
//  Created by Горявин Владимир on 28.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGStudent.h"

@implementation VGStudent

- (NSString *) description {
    NSString* desriptionStudent = [NSString stringWithFormat: @"My name's %@ and surname's %@", self.name, self.surname];
    return desriptionStudent;
}

- (void) sayHello {
    NSLog(@"Hello! I'm %@ %@", self.name, self.surname);
}

- (NSString*) studentID {
    NSString* stID = [NSString stringWithFormat: @"%@ %@", self.name, self.surname];
    return stID;
}

@end
