//
//  AppDelegate.m
//  SK-Lesson-6 Data Types
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "DSStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOOL boolVar = NO;

    NSInteger intVar = 10;

    NSUInteger uIntVar = 100;

    CGFloat floatVar = 1.5f;

    double doubleVar = 2.5f;
    
    NSNumber *boolObject = [NSNumber numberWithBool:boolVar];
    NSNumber *intObject = [NSNumber numberWithInteger:intVar];
    NSNumber *uIntObject = [NSNumber numberWithUnsignedInteger :uIntVar];
    NSNumber *floatObject = [NSNumber numberWithFloat:floatVar];
    NSNumber *doubleObject = [NSNumber numberWithDouble:doubleVar];
    
    NSArray *array = [NSArray arrayWithObjects: boolObject, intObject, uIntObject, floatObject, doubleObject, nil];
    
    CGPoint point1 = CGPointMake(7, 8);
    [NSValue valueWithCGPoint:point1];
    
    NSLog(@"%@", array);
    
    NSLog(@"boolVar = %d, intVar = %ld, uIntVar = %lu, floatVar = %f, doubleVar = %f",         [[array objectAtIndex:0] boolValue],
          [[array objectAtIndex:1] integerValue],
          [[array objectAtIndex:2] unsignedIntegerValue],
          [[array objectAtIndex:3] floatValue],
          [[array objectAtIndex:4] doubleValue]);

    NSLog(@"boolVar = %d, intVar = %ld, uIntVar = %lu, floatVar = %f, doubleVar = %f", boolVar, intVar, uIntVar, floatVar, doubleVar);
    NSLog(@"boolVar = %ld, intVar = %ld, uIntVar = %ld, floatVar = %ld, doubleVar = %ld", sizeof(boolVar), sizeof(intVar), sizeof(uIntVar), sizeof(floatVar), sizeof(doubleVar));

    NSInteger someFloat = floatVar;
    
    DSStudent *studentA = [[DSStudent alloc] init];
    
    studentA.name = @"Best student";
    
    DSStudent *studentB = studentA;
    
    studentB.name = @"Bad student";
    
    NSLog(@"%@", studentA.name);
    
    
    NSInteger a = 10;
    
    NSLog(@"a = %ld", a);
    
    NSInteger b = a;
    
    b = 5;
    
    NSLog(@"a = %ld", a);
    
    NSInteger *c = &a;
    
    *c = 7;
    
    NSLog(@"a = %ld", a);
    
    [self test:5 testPointer:&a];
    
    NSLog(@"a = %ld", a);
    
    
    DSStudent *student = [[DSStudent alloc] init];
    
    student.gender = DSGenderMale;
    
    DSInteger myOwnInteger = 15;
    
    NSLog(@"%ld", myOwnInteger);
    
    
    CGPoint point;
    CGSize size;
    CGRect rect;
    
    point.x = 5.f;
    point.y = 10.f;
    
    size.width = 10.f;
    size.height = 12.f;
    
    rect.origin.x = 3.5f;
    rect.origin.y = 4.2f;
    rect.size.height = 7.f;
    rect.size.width = 12.f;
    
    return YES;
}

- (NSInteger)test:(NSInteger) test testPointer:(NSInteger*) pointer {
    *pointer = 77;
    return test;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
