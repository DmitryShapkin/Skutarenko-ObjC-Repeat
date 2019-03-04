//
//  AppDelegate.m
//  SK-Lesson-3
//
//  Created by Dmitry Shapkin on 03/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DSBoxer.h"

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
    
    DSBoxer *boxer = [[DSBoxer alloc] init];
    
//    boxer.name = @"Vasiliy";
//    boxer.age = 25;
//    boxer.height = 1.8f;
//    boxer.weight = 80.f;
    
    //boxer.nameCount = 0;
    
    // Setters:
    [boxer setName:@"Vasiliy"];
    [boxer setAge:25];
    [boxer setHeight:1.8f];
    [boxer setWeight:80.f];
    
    NSLog(@"name = %@", boxer.name);
    NSLog(@"name = %@", [boxer name]);
    NSLog(@"name = %@", [boxer name]);
    NSLog(@"name = %@", [boxer name]);
    NSLog(@"name = %@", [boxer name]);
    
//    NSLog(@"name = %@", boxer.name);
//    NSLog(@"age = %ld", boxer.age);
//    NSLog(@"height = %f", boxer.height);
//    NSLog(@"weight = %f", boxer.weight);
    
    NSLog(@"name = %@", [boxer name]);
    NSLog(@"age = %ld", [boxer age]);
    NSLog(@"height = %f", [boxer height]);
    NSLog(@"weight = %f", [boxer weight]);
    
    [boxer howOldAreYou];
    
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
