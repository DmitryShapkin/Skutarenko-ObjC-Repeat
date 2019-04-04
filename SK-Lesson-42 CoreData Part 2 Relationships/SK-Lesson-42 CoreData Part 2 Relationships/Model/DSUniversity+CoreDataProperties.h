//
//  DSUniversity+CoreDataProperties.h
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSUniversity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSUniversity (CoreDataProperties)

+ (NSFetchRequest<DSUniversity *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSObject *name;
@property (nullable, nonatomic, retain) NSSet<DSStudent *> *students;
@property (nonatomic, retain) NSSet *courses;

@end

@interface DSUniversity (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(DSStudent *)value;
- (void)removeStudentsObject:(DSStudent *)value;
- (void)addStudents:(NSSet<DSStudent *> *)values;
- (void)removeStudents:(NSSet<DSStudent *> *)values;

@end

NS_ASSUME_NONNULL_END
