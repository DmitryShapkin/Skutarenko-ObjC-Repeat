//
//  DSUniversity+CoreDataProperties.m
//  SK-Lesson-43 CoreData Part 3 Fetching
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
