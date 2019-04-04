//
//  DSCourse+CoreDataProperties.m
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSCourse+CoreDataProperties.h"

@implementation DSCourse (CoreDataProperties)

+ (NSFetchRequest<DSCourse *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DSCourse"];
}

@dynamic name;
@dynamic university;
@dynamic students;

@end
