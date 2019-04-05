//
//  DSObject+CoreDataProperties.h
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//

#import "DSObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSObject (CoreDataProperties)

+ (NSFetchRequest<DSObject *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
