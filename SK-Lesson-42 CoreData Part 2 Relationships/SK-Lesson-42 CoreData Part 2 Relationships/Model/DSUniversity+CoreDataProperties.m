//
//  DSUniversity+CoreDataProperties.m
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSUniversity+CoreDataProperties.h"

@implementation DSUniversity (CoreDataProperties)

+ (NSFetchRequest<DSUniversity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DSUniversity"];
}

@dynamic name;
@dynamic students;
@dynamic courses;

@end
