//
//  AppDelegate.m
//  SK-Lesson-33 UITableView Navigation Part 1
//
//  Created by Dmitry Shapkin on 01/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController* vc = [[ViewController alloc] initWithFolderPath:@"/Users"];
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navController;
    
    return YES;
}



@end
