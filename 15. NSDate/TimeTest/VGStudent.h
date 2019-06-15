//
//  VGStudent.h
//  TimeTest
//
//  Created by Горявин Владимир on 20.03.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGStudent : NSObject

@property (strong, nonatomic) NSDate* dateOfBirth;
@property (strong, nonatomic) NSString* alias;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;

@end

NS_ASSUME_NONNULL_END
