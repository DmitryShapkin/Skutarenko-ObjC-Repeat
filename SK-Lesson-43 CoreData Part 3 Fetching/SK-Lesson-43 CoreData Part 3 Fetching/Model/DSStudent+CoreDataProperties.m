//
//  DSStudent+CoreDataProperties.m
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSStudent+CoreDataProperties.h"

@implementation DSStudent (CoreDataProperties)

+ (NSFetchRequest<DSStudent *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DSStudent"];
}

@dynamic firstName;
@dynamic lastName;
@dynamic dateOfBirth;
@dynamic score;
@dynamic car;
@dynamic university;
@dynamic courses;

@end
