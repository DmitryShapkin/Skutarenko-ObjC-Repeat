//
//  DSStudent+CoreDataProperties.h
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSStudent+CoreDataClass.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DSCar, DSCourse, DSUniversity;

@interface DSStudent (CoreDataProperties)

@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) DSCar *car;
@property (nonatomic, retain) DSUniversity *university;
@property (nonatomic, retain) NSSet *courses;
@end

@interface DSStudent (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(DSCourse *)value;
- (void)removeCoursesObject:(DSCourse *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
