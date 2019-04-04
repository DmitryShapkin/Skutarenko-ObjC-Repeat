//
//  DSCar+CoreDataProperties.h
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSCar+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSCar (CoreDataProperties)

+ (NSFetchRequest<DSCar *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *model;
@property (nullable, nonatomic, retain) DSStudent *owner;

@end

NS_ASSUME_NONNULL_END
