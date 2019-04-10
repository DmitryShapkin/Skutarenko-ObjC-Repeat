//
//  ASDataManager.h
//  SK-Lesson-44 CoreData Part 4 FRC
//
//  Created by Dmitry Shapkin on 05/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface ASDataManager : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+ (ASDataManager*) sharedManager;

- (void) generateAndAddUniversity;

@end

NS_ASSUME_NONNULL_END
