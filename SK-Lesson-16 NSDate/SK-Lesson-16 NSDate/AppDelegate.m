//
//  AppDelegate.m
//  SK-Lesson-16 NSDate
//
//  Created by Dmitry Shapkin on 10/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "DSObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDate* date = [NSDate date];

    NSLog(@"%@", date);

    NSLog(@"%@", [date dateByAddingTimeInterval:5000]);
    NSLog(@"%@", [date dateByAddingTimeInterval:-5000]);

    NSLog(@"%f", [date timeIntervalSince1970]);

//    NSDate* date2 = [NSDate dateWithTimeIntervalSinceReferenceDate:10];
//    NSLog(@"%@", date2);
    
    // NSDateFormatter
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    // [dateFormatter setDateFormat:@"yyyy MM MMM MMMM MMMMM"];
    // [dateFormatter setDateFormat:@"yyyy/MM/dd EEE EEEE EEEEE"];
    // [dateFormatter setDateFormat:@"yyyy-MM-dd EEEE hh:mm:SSS a W"];

    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];

    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    NSDate* date3 = [dateFormatter dateFromString:@"2008/05/17 15:37"];

    NSLog(@"%@", date3);

    // Calendar
    
    NSDate* date1 = [NSDate date];
    // NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:-1005000];

    NSCalendar* calendar = [NSCalendar currentCalendar];

    NSDateComponents* components1 = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date1];

    NSLog(@"%@", components1);

    NSInteger hour = [components1 hour];

    NSLog(@"%ld", hour);
    
    // Months between
    
    NSDate* dateOne = [NSDate date];
    NSDate* dateTwo = [NSDate dateWithTimeIntervalSinceNow:-1005000];

    NSCalendar* calendar2 = [NSCalendar currentCalendar];

    NSDateComponents* components = [calendar2 components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                               fromDate:dateTwo
                                                 toDate:dateOne
                                                    options:0];

    NSLog(@"%@", components);

    // Some experiment with memory leak
    
    DSObject* obj = [[DSObject alloc] init];

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
