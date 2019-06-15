//
//  VGStudent.m
//  BitsTest
//
//  Created by Горявин Владимир on 13.03.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "VGStudent.h"

@implementation VGStudent

- (NSString* ) answerByType: (VGStudentSubjectType) type {
    
    return self.subjectType & type ? @"YES" : @"NO";
}


- (NSString* ) description {
    
    return [NSString stringWithFormat: @"%@ studies:\n"
                                                    "biology = %@\n"
                                                    "anatomy = %@\n"
                                                    "development = %@\n"
                                                    "engineering = %@\n"
                                                    "math = %@\n"
                                                    "phycology = %@\n"
                                                    "art = %@\n"
                                                    "literature = %@",
                                                    self.alias,
                                                    [self answerByType:  VGStudentSubjectTypeBiology],
                                                    [self answerByType:  VGStudentSubjectTypeAnatomy],
                                                    [self answerByType:  VGStudentSubjectTypeDevelopment],
                                                    [self answerByType:  VGStudentSubjectTypeEngineering],
                                                    [self answerByType:  VGStudentSubjectTypeMath],
                                                    [self answerByType:  VGStudentSubjectTypePhycology],
                                                    [self answerByType:  VGStudentSubjectTypeArt],
                                                    [self answerByType: VGStudentSubjectTypeLiterature]];
}


@end
