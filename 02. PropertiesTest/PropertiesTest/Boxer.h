//
//  Boxer.h
//  PropertiesTest
//
//  Created by Горявин Владимир on 23.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Boxer : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;
//@property (assign, nonatomic) NSInteger nameCount;

- (NSInteger) howOldAreYou;

@end
