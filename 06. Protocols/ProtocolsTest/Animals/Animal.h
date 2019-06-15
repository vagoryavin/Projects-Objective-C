//
//  Animal.h
//  Schoolboy
//
//  Created by Горявин Владимир on 06.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animal : NSObject

@property(strong, nonatomic) NSString* nickname;
@property(assign, nonatomic) NSInteger age;

- (void) moveAnimal;

@end
