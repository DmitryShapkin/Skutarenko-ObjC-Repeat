//
//  DSCar+CoreDataProperties.m
//  SK-Lesson-43 CoreData Part 3 Fetching
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
