//
//  Human.h
//  ArraysTest
//
//  Created by Горявин Владимир on 31.08.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Human : NSObject

typedef NS_ENUM(NSInteger, GenderMode){
    genderMale,
    genderFemale
};

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) GenderMode gender;

- (void) move;

@end
