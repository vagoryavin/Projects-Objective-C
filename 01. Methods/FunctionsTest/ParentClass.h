//
//  ParentClass.h
//  FunctionsTest
//
//  Created by Горявин Владимир on 22.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParentClass : NSObject

+ (void) whoAreYou;
+ (void) whoAreYou: (NSString*) string;

- (void) sayHello;
- (void) say: (NSString*) string;
- (void) say: (NSString*) string1 and: (NSString*) string2;
- (NSString*) saySomething;
@end
