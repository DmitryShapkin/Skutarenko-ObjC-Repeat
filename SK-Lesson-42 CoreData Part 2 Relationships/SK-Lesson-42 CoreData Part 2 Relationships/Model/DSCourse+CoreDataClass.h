//
//  DSCourse+CoreDataClass.h
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import "DSObject+CoreDataClass.h"

@class DSStudent, DSUniversity;

NS_ASSUME_NONNULL_BEGIN

@interface DSCourse : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "DSCourse+CoreDataProperties.h"
