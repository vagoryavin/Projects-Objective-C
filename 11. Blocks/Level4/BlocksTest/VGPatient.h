//
//  VGPatient.h
//  DelegatesTest
//
//  Created by Горявин Владимир on 06.10.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VGPatient;

typedef  VGPatient* (^BlockPatient)(void);

@interface VGPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
@property (copy, nonatomic) BlockPatient blockPatient;

- (BOOL) iGetSick;

@end

