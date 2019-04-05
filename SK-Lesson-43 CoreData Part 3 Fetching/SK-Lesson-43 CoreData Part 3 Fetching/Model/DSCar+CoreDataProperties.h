//
//  DSCar+CoreDataProperties.h
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSCar+CoreDataClass.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DSStudent;

@interface DSCar (CoreDataProperties)

@property (nonatomic, retain) NSString *model;
@property (nonatomic, retain) DSStudent *owner;

@end

