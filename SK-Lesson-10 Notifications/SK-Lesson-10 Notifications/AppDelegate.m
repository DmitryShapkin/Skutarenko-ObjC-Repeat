//
//  AppDelegate.m
//  SK-Lesson-10 Notifications
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "DSGovernment.h"
#import "DSDoctor.h"

@interface AppDelegate () // Category

@property (strong, nonatomic) DSGovernment* government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.government = [[DSGovernment alloc] init];
    
    //NSLog(@"%@", DSGovernmentSalaryDidChangeNotification);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:DSGovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    DSDoctor* doctor1 = [[DSDoctor alloc] init];
    DSDoctor* doctor2 = [[DSDoctor alloc] init];
    DSDoctor* doctor3 = [[DSDoctor alloc] init];
    DSDoctor* doctor4 = [[DSDoctor alloc] init];
    DSDoctor* doctor5 = [[DSDoctor alloc] init];
    
    doctor1.salary = doctor2.salary = doctor3.salary = doctor4.salary = doctor5.salary = self.government.salary;
    
    self.government.taxLevel = 5.5;
    self.government.salary = 1100;
    self.government.averagePrice = 15;
    self.government.pension = 550;
    
    self.government.taxLevel = 5.5;
    self.government.taxLevel = 5.5;
    self.government.taxLevel = 5.5;
    self.government.taxLevel = 5.5;
    
    self.government.salary = 1050;
    self.government.salary = 1150;
    self.government.salary = 950;
    
    // It is very important to remove NSNotificationCenter. I did it in dealloc method.
    
    return YES;
}

- (void)dealloc
{
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:DSGovernmentTaxLevelDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)governmentNotification:(NSNotification*) notification {
    NSLog(@"governmentNotification = %@", notification.userInfo);
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
