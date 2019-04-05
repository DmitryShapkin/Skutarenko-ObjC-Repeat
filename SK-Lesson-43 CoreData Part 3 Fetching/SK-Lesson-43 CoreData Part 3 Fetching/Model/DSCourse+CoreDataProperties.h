//
//  DSCourse+CoreDataProperties.h
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSCourse+CoreDataClass.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class DSStudent, DSUniversity;

@interface DSCourse (CoreDataProperties)

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) DSUniversity *university;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) NSArray *bestStudents;
@property (nonatomic, retain) NSArray *studentsWithManyCourses;
@end

@interface DSCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(DSStudent *)value;
- (void)removeStudentsObject:(DSStudent *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
