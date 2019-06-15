//
//  VGStudent.h
//  BitsTest
//
//  Created by Горявин Владимир on 13.03.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    VGStudentSubjectTypeBiology        = 1 << 0,  
    VGStudentSubjectTypeMath           = 1 << 1,
    VGStudentSubjectTypeDevelopment    = 1 << 2,
    VGStudentSubjectTypeEngineering    = 1 << 3,
    VGStudentSubjectTypeArt            = 1 << 4,
    VGStudentSubjectTypePhycology      = 1 << 5,
    VGStudentSubjectTypeAnatomy        = 1 << 6,
    VGStudentSubjectTypeLiterature     = 1 << 7
    
} VGStudentSubjectType;

NS_ASSUME_NONNULL_BEGIN

@interface VGStudent : NSObject

@property (strong, nonatomic) NSString* alias;
@property (assign, nonatomic) VGStudentSubjectType subjectType;

@end

NS_ASSUME_NONNULL_END

