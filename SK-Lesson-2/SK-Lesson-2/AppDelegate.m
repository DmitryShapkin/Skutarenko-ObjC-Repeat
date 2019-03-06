//
//  AppDelegate.m
//  SK-Lesson-2
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ChildClass.h"


@interface AppDelegate ()

@property (weak, nonatomic) ChildClass *child;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];

    ParentClass *parent = [[ParentClass alloc] init];
    
    [parent sayHello];
    
    [parent say:@"How are you?"];
    
    [parent say:@"I was worried about you" and:@"where have you been?"];
    
    [parent say:@"Hope you are ok!" and:@"Are you?" andAfterThat:@"Are you sure?"];
    
    NSLog(@"%@", [parent saySomething]);
    
    [ParentClass whoAreYou];
    
    [ChildClass whoAreYou];
    
    ChildClass *child = [[ChildClass alloc] init];
    NSLog(@"%p", child);
    self.child = child;
    
    if ([child respondsToSelector:@selector(sayHello)]) {
        NSLog(@"RESPONDS");
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
    
    NSLog(@"%p", self.child);
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