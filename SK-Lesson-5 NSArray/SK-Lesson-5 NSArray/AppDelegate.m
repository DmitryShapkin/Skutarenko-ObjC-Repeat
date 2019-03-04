//
//  AppDelegate.m
//  SK-Lesson-5 NSArray
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "DSObject.h"
#import "DSChild.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSArray *array = [[NSArray alloc] initWithObjects:@"String 1", @"String 2", @"String 3", nil];
    
//    NSArray *array = [NSArray arrayWithObjects:@"String 1", @"String 2", @"String 3", nil];
    
//    NSArray *array = @[@"String 1", @"String 2", @"String 3"];
    
//    for (int i = 0; i < [array count]; i++)  {
//        NSLog(@"%@", [array objectAtIndex:i]);
//    }
    
//    for (int i = [array count] - 1; i >= 0; i--)  {
//        NSLog(@"%@", [array objectAtIndex:i]);
//    }
    
//    // Crazy test for unsigned int
//    NSUInteger someInt = -5;
//    NSLog(@"%lu", someInt);
    
//    for (id string in array) {
//        NSLog(@"%@", string);
//        NSLog(@"%lu", [array indexOfObject:string]);
//    }
    
    
    DSObject *obj1 = [[DSObject alloc] init];
    DSObject *obj2 = [[DSObject alloc] init];
    DSChild *obj3 = [[DSChild alloc] init];
    
    obj1.name = @"Object 1";
    obj2.name = @"Object 2";
    [obj3 setName:@"Object 3"];
    
    obj3.lastName = @"Shapkin";
    
    NSArray *array = @[obj1, obj2, obj3];
    
    for (DSObject *obj in array) {
        NSLog(@"name = %@", obj.name);
        
        if ([obj respondsToSelector:@selector(action)]) {
            [obj action];
        }
        
        if ([obj isKindOfClass:[DSChild class]]) {
            DSChild *child = (DSChild*)obj;
            NSLog(@"%@", child.lastName);
        }
    }
    
    NSLog(@"Finish");
    
    return YES;
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
