//
//  DSStudent+CoreDataProperties.h
//  SK-Lesson-41 Part 1 Basics
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSStudent (CoreDataProperties)

+ (NSFetchRequest<DSStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSDate *dateOfBirth;
@property (nonatomic) double score;

@end

NS_ASSUME_NONNULL_END
