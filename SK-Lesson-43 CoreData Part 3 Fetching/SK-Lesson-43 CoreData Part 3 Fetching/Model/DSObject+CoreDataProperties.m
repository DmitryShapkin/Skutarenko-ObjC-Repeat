//
//  DSObject+CoreDataProperties.m
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSObject+CoreDataProperties.h"

@implementation DSObject (CoreDataProperties)

+ (NSFetchRequest<DSObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DSObject"];
}


@end
