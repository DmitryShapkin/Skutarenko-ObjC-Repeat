//
//  DSCar+CoreDataProperties.m
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSCar+CoreDataProperties.h"


@implementation DSCar (CoreDataProperties)

+ (NSFetchRequest<DSCar *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DSCar"];
}

@dynamic model;
@dynamic owner;

@end
