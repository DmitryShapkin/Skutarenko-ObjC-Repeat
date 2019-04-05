//
//  DSUniversity+CoreDataProperties.h
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSUniversity+CoreDataClass.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DSStudent;

@interface DSUniversity (CoreDataProperties)

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) NSSet *courses;
@end

@interface DSUniversity (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(DSStudent *)value;
- (void)removeStudentsObject:(DSStudent *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

- (void)addCoursesObject:(NSManagedObject *)value;
- (void)removeCoursesObject:(NSManagedObject *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
