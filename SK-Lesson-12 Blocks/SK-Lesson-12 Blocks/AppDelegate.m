//
//  AppDelegate.m
//  SK-Lesson-12 Blocks
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "DSObject.h"

typedef void (^OurTestBlock)(void);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock someTestBlock;
@property (strong, nonatomic) NSString* name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1. Ничего не принимает, ничего не возвращает
    
    // [self testMethod];
    // NSObject* testObject;
    
    void (^testblock)(void);
    
    testblock = ^{
        NSLog(@"test block");
    };
    
    // testblock();
    // testblock();
    testblock();
    
    // 2. Принимает параметры
    
    // [self testMethodWithParams:@"Some string" value:7];
    
    void (^testBlockWithParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue){
        NSLog(@"testBlockWithParams: %@, %ld", string, intValue);
    };
    
    testBlockWithParams(@"Some string", 777);
    
    // 3. Возвращает параметры и принимает
    
    // NSString* returnedString = [self testMethodWithReturnValueAndParams:@"Returned string" value:789];
    // NSLog(@"%@", returnedString);
    
    NSString* (^testBlockWithReturnValueAndParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue){
        NSLog(@"777");
        return [NSString stringWithFormat:@"testBlockWithReturnValueAndParams: %@, %ld", string, intValue];
    };
    
    NSString* returnedString = testBlockWithReturnValueAndParams(@"Call nine-one-one", 911);
    NSLog(@"%@", returnedString);
    
    
    // Another part of lesson. We can pass variable into block.
    
    NSString* testString = @"How is it possible?";
    
    __block NSInteger count = 0;
    
    void (^testBlock2)(void) = ^{
        NSLog(@"testBlock2");
        NSLog(@"%@", testString);
        count++;
    };
    
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    
    NSLog(@"%ld", count);
    
    // Another my own test. Pass variable and mutate it in block. /** Test failed */
    
    __block NSString* someString = @"Dmitry";
    
    void (^myOwnBlock)(NSString*) = ^(NSString* string){
        NSLog(@"Now we want to change incoming value");
        someString = @"bla-bla-bla";
    };
    
    myOwnBlock(someString);
    
    NSLog(@"%@", someString);
    
    /**
     Create method with incoming block. And trying to pass block to this method.
     Let's see what do we'll get.
     */
    
    void (^mySecondOwnBlock)(void) = ^{
        NSLog(@"Inside mySecondOwnBlock");
    };
    
    // First realization
    [self testBlockMethod:mySecondOwnBlock];
    
    // Second realization
    [self testBlockMethod:^{
        NSLog(@"Another realization for block");
    }];
    
    /**
     Create our own block at the top of this file (look for typedef)
     */
    
    OurTestBlock testBlock3 = ^{
        NSLog(@"testBlock3");
    };
    
    testBlock3();
    
    // Another sample
    
    [self testBlockMethod2:^{
        NSLog(@"testBlockMethod2");
    }];
    
    /**
     Let's play with objects. How do they behave themselves.
     Something interesting with memory.
     */
    
    DSObject* obj = [DSObject new];
    
    // very interesting moment with __weak:
    __weak DSObject* weakObj = obj;
    
    weakObj.name = @"Dmitry";

    self.someTestBlock = ^{
        NSLog(@"%@", weakObj.name);
    };
    
    self.someTestBlock();
    
    /**
     Another sample
     */
    
    self.name = @"Hello";
    
    DSObject* obj1 = [DSObject new];
    obj1.name = @"Dmitry";
    
    [obj1 testMethod:^{
        NSLog(@"%@", self.name);
    }];
    
    NSLog(@"Finish");

    return YES;
}

- (void)testMethod {
    NSLog(@"test method");
}

- (void)testMethodWithParams:(NSString*) string value:(NSInteger) intValue {
    NSLog(@"testMethodWithParams: %@ %ld", string, intValue);
}

- (NSString*)testMethodWithReturnValueAndParams:(NSString*) string value:(NSInteger) intValue {
    return [NSString stringWithFormat: @"testMethodWithParams: %@ %ld", string, intValue];
}

- (void)testBlockMethod:(void (^)(void)) testBlock {
    NSLog(@"Start method with incoming block");
    testBlock();
}

- (void)testBlockMethod2:(OurTestBlock) testBlock {
    NSLog(@"Start method with incoming block");
    testBlock();
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
