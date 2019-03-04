//
//  DSStudent.h
//  SK-Lesson-6 Data Types
//
//  Created by Dmitry Shapkin on 05/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    DSGenderMale = 5,
    DSGenderFemale
} DSGender;

typedef NSInteger DSInteger;

@interface DSStudent : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) DSGender gender;

@end
