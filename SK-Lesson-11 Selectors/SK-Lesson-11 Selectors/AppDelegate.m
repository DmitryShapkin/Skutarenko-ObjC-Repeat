//
//  AppDelegate.m
//  SK-Lesson-11 Selectors
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "DSObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 Hello, stranger!
 Please pay no attention on my syntax here :)
 This is just for practice.
 Bye.
 DS *fly away
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    DSObject *obj = [[DSObject alloc] init];
    
    SEL selector1 = @selector(testMethod);
    SEL selector2 = @selector(testMethod:);
    SEL selector3 = @selector(testMethod:anotherParam:);
    SEL selector4 = @selector(testMethod:anotherParam:thirdParam:);
    
    [self performSelector:selector1];
    [self performSelector:selector2 withObject:@"Say something"];
    [self performSelector:selector3 withObject:@"Say something1" withObject:@"Say something2"];
    
    // It doesn't work:
    // [self performSelector:selector4 withObject:@"Say something1" withObject:@"Say something2" withObject:@"Say something3"];
    
    [self performSelector:selector1 withObject:nil afterDelay:5.f];
    [obj performSelector:selector1];
    
    NSLog(@"%@", [obj performSelector:@selector(superSecretText)]);
    
    // Just testing
    if (nil == NULL) {
        NSLog(@"nil == NULL");
    }
    
    // It doesn't work:
    [self performSelector:@selector(testMethodParameter1:) withObject:@11];
    
    // Create string from selector
    NSString* a = NSStringFromSelector(selector1);
    
    // Create selector from string
    SEL sel = NSSelectorFromString(a);
    [self performSelector:sel];

    // Test with more than 2 parameters:
//    NSString* string = [self testMethodParameter1:2 parameter2:3.1 parameter3:5.5];
//    NSLog(@"string = %@", string);
    
    // Another try for more than 2 params with NSInvocation
    
    SEL selector = @selector(testMethodParameter1:parameter2:parameter3:);
    
    NSMethodSignature *signature = [AppDelegate instanceMethodSignatureForSelector:selector];
    
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    NSInteger iVal = 2;
    CGFloat fVal = 3.1f;
    double dVal = 5.5f;
    
    NSInteger* p1 = &iVal;
    CGFloat* p2 = &fVal;
    double* p3 = &dVal;
    
    [invocation setArgument:p1 atIndex:2];
    [invocation setArgument:p2 atIndex:3];
    [invocation setArgument:p3 atIndex:4];
    
    [invocation invoke];
    
    __unsafe_unretained NSString* string = nil;
    
    [invocation getReturnValue:&string];
    
    NSLog(@"string = %@", string);
    
    return YES;
}

// Bad practice:
- (void)tralala:(NSInteger) a {
    
}

- (void)testMethod {
    NSLog(@"testMethod");
}

- (void)testMethod:(NSString*) string {
    NSLog(@"testMethod: %@", string);
}

- (void)testMethod:(NSString*) string anotherParam:(NSString*) stringTwo {
    NSLog(@"testMethod: %@, %@", string, stringTwo);
}

- (void)testMethod:(NSString*) string anotherParam:(NSString*) stringTwo thirdParam:(NSString*) stringThree {
    NSLog(@"testMethod: %@, %@, %@", string, stringTwo, stringThree);
}

- (void)testMethodParameter1:(NSInteger) intValue {
    NSLog(@"testMethodParameter1: %ld", intValue);
}

- (NSString*)testMethodParameter1:(NSInteger) intValue parameter2:(CGFloat) floatValue parameter3:(double) doubleValue {
    
    return [NSString stringWithFormat:@"testMethodParameter1: %ld, parameter2: %fm parameter3: %f", intValue, floatValue, doubleValue];
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
