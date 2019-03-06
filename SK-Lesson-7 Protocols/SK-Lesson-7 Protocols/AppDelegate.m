//
//  AppDelegate.m
//  SK-Lesson-7 Protocols
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "PatientProtocol.h"
#import "DSStudent.h"
#import "DSDancer.h"
#import "DSDeveloper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = UIColor.redColor;
    UIViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    DSDancer* dancer1 = [[DSDancer alloc] init];
    DSDancer* dancer2 = [[DSDancer alloc] init];
    dancer1.favouriteDance = @"Bachata";
    
    DSStudent* student1 = [[DSStudent alloc] init];
    DSStudent* student2 = [[DSStudent alloc] init];
    DSStudent* student3 = [[DSStudent alloc] init];
    
    student1.universityName = @"Stanford University";
    student1.name = @"Dmitry";
    
    DSDeveloper* developer1 = [[DSDeveloper alloc] init];
    developer1.experience = 10;
    
    dancer1.name = @"dancer1";
    dancer2.name = @"dancer2";
    
    student1.name = @"student1";
    student2.name = @"student1";
    student3.name = @"student1";
    
    developer1.name = @"developer1";
    
    NSObject* fake = [[NSObject alloc] init];
    
    NSArray* patients = [NSArray arrayWithObjects: fake, dancer1, dancer2, student1, student2, student3, developer1, nil];
    NSLog(@"%@", patients);
    
    // Полиморфизм по NSObject
    
//    for (id item in patients) {
//        NSLog(@"%@", item);
//        if ([item respondsToSelector:@selector(howIsYourJob)]) {
//            [item howIsYourJob];
//        }
//    }
    
    // Полиморфизм по протоколу

    for (id <PatientProtocol> patient in patients) {
        
        if ([patient conformsToProtocol:@protocol(PatientProtocol)]) {
            
            NSLog(@"%@", patient.name);
            
            if ([patient respondsToSelector:@selector(howIsYourJob)]) {
                NSLog(@"How is you job?\n%@", [patient howIsYourJob]);
            }
            
            if (![patient areYouOk]) {
                [patient takePill];
                
                if (![patient areYouOk]) {
                    [patient makeShot];
                }
            }
        } else {
            NSLog(@"Fake!");
        }
    }

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
