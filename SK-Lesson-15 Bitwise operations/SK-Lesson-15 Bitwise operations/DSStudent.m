//
//  DSStudent.m
//  SK-Lesson-15 Bitwise operations
//
//  Created by Dmitry Shapkin on 10/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSStudent.h"

@implementation DSStudent

//- (NSString *)description
//{
//    return [NSString stringWithFormat:@"Student studies:\n"
//            "bioligy = %@\n"
//            "math = %@\n"
//            "development = %@\n"
//            "engeneering = %@\n"
//            "art = %@\n"
//            "psychology = %@\n"
//            "anatomy = %@",
//            self.studiesBiology ? @"YES" : @"NO",
//            self.studiesMath ? @"YES" : @"NO",
//            self.studiesDevelopment ? @"YES" : @"NO",
//            self.studiesEngineering ? @"YES" : @"NO",
//            self.studiesArt ? @"YES" : @"NO",
//            self.studiesPsychology ? @"YES" : @"NO",
//            self.studiesAnatomy ? @"YES" : @"NO"];
//}

- (NSString*) answerByType:(DSStudentSubjectType) type {
    return self.subjectType & type ? @"YES" : @"NO";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Student studies:\n"
            "bioligy = %@\n"
            "math = %@\n"
            "development = %@\n"
            "engeneering = %@\n"
            "art = %@\n"
            "psychology = %@\n"
            "anatomy = %@",
            [self answerByType:DSStudentSubjectTypeBiology],
            [self answerByType:DSStudentSubjectTypeMath],
            [self answerByType:DSStudentSubjectTypeDevelopment],
            [self answerByType:DSStudentSubjectTypeEngineering],
            [self answerByType:DSStudentSubjectTypeArt],
            [self answerByType:DSStudentSubjectTypePsychology],
            [self answerByType:DSStudentSubjectTypeAnatomy]];
}

@end
