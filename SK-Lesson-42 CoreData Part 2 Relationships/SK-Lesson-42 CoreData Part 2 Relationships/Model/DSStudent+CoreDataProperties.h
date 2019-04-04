//
//  DSStudent+CoreDataProperties.h
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSStudent+CoreDataClass.h"
#import "DSCar+CoreDataClass.h"
#import "DSUniversity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSStudent (CoreDataProperties)

+ (NSFetchRequest<DSStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSDate *dateOfBirth;
@property (nonatomic) double score;
@property (nullable, nonatomic, retain) DSCar *car;
@property (nullable, nonatomic, retain) DSUniversity *university;
@property (nonatomic, retain) NSSet *courses;

@end

NS_ASSUME_NONNULL_END
