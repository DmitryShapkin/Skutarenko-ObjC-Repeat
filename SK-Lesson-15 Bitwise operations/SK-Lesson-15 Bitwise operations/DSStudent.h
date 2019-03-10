//
//  DSStudent.h
//  SK-Lesson-15 Bitwise operations
//
//  Created by Dmitry Shapkin on 10/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    DSStudentSubjectTypeBiology         = 1 << 0,
    DSStudentSubjectTypeMath            = 1 << 1,
    DSStudentSubjectTypeDevelopment     = 1 << 2,
    DSStudentSubjectTypeEngineering     = 1 << 3,
    DSStudentSubjectTypeArt             = 1 << 4,
    DSStudentSubjectTypePsychology      = 1 << 5,
    DSStudentSubjectTypeAnatomy         = 1 << 6
} DSStudentSubjectType;

@interface DSStudent : NSObject

@property (assign, nonatomic) DSStudentSubjectType subjectType;

//@property (assign, nonatomic) BOOL studiesBiology;
//@property (assign, nonatomic) BOOL studiesMath;
//@property (assign, nonatomic) BOOL studiesDevelopment;
//@property (assign, nonatomic) BOOL studiesEngineering;
//@property (assign, nonatomic) BOOL studiesArt;
//@property (assign, nonatomic) BOOL studiesPsychology;
//@property (assign, nonatomic) BOOL studiesAnatomy;

@end

NS_ASSUME_NONNULL_END
