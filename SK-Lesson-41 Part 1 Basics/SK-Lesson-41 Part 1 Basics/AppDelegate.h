//
//  AppDelegate.h
//  SK-Lesson-41 Part 1 Basics
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

