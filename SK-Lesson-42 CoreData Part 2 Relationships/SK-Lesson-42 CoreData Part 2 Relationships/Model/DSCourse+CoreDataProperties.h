//
//  DSCourse+CoreDataProperties.h
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSCourse+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSCourse (CoreDataProperties)

+ (NSFetchRequest<DSCourse *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) DSUniversity *university;
@property (nullable, nonatomic, retain) NSSet<DSStudent *> *students;

@end

@interface DSCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(DSStudent *)value;
- (void)removeStudentsObject:(DSStudent *)value;
- (void)addStudents:(NSSet<DSStudent *> *)values;
- (void)removeStudents:(NSSet<DSStudent *> *)values;

@end

NS_ASSUME_NONNULL_END
