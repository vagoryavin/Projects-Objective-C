//
//  VGStudent.h
//  DictionaryTest
//
//  Created by Горявин Владимир on 28.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;

- (void) sayHello;
- (NSString*) studentID;

@end

NS_ASSUME_NONNULL_END
