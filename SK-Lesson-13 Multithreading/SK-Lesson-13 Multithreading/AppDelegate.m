//
//  AppDelegate.m
//  SK-Lesson-13 Multithreading
//
//  Created by Dmitry Shapkin on 08/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation AppDelegate

extern void _objc_autoreleasePoolPrint(void);

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"%@", [NSThread currentThread]);
    
    NSString* myString = @"Dmitry Shapkin";
    
    // 1. Simple way to run some method in background:
    
    [self performSelectorInBackground:@selector(testThread:) withObject:myString];
    [self performSelectorInBackground:@selector(testThread:) withObject:myString];
    [self performSelectorInBackground:@selector(testThread:) withObject:myString];

    NSLog(@"%@", [NSThread currentThread]);
    
    // 2. Thread
    
    NSLog(@"%i", [[NSThread currentThread] isMainThread]);
    
    for (int i = 0; i < 10; i++) {
        NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread:) object:myString];
        thread.name = [NSString stringWithFormat:@"Thread #%d", i];
        NSLog(@"%@", thread.name);
        NSLog(@"%@", thread);
        [thread start];
    }
    
    NSThread* threadOfMine = [[NSThread alloc] initWithTarget:self selector:@selector(testThread:) object:myString];

    NSLog(@"%@", threadOfMine);
    // [thread cancel];
    NSLog(@"%@", threadOfMine);
    [threadOfMine start];
    
    // Thread with block:
    NSThread* threadBlock = [[NSThread alloc] initWithBlock:^{
        for (int i = 0; i < 10000; i++) {
            NSLog(@"%@ %d %@", myString, i, [NSThread currentThread]);
        }
    }];

    [threadBlock start];
    
    // 3. NSMutableArray

    NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
    NSThread* thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"o"];
    thread.name = @"Thread #1";
    thread2.name = @"Thread #2";

    [thread start];
    [thread2 start];

    self.array = [[NSMutableArray alloc] init];

    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];

    // 4. GRAND CENTRAL DISPATCH
    
    // Create a queue
    dispatch_queue_t queue2 = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);

    NSLog(@"First: %@", [[NSThread currentThread] isMainThread] ? @"YES" : @"NO");

    dispatch_async(queue2, ^{

        double startTime = CACurrentMediaTime();

        NSLog(@"%@ started", [[NSThread currentThread] name]);

        for (int i = 0; i < 200000; i++) {
        }

        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);

        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"Second: %@", [[NSThread currentThread] isMainThread] ? @"YES" : @"NO");

        dispatch_sync(queue2, ^{
            NSLog(@"Third: %@", [NSThread currentThread]);
            NSLog(@"Third: %@", [[NSThread currentThread] isMainThread] ? @"YES" : @"NO");
        });
    });
    
    // 5. Test with sync-async
    
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t backQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
    NSLog(@"MAIN 1: %@", [NSThread currentThread]);

    dispatch_async(queue, ^{
        NSLog(@"DEFAULT 1: %@", [NSThread currentThread]);

        [self myOwnMethod];
    });

    dispatch_sync(queue, ^{
        NSLog(@"MAIN 2: %@", [NSThread currentThread]);
    });

    // Try for back:
    dispatch_async(backQueue, ^{
        NSLog(@"DEFAULT 2: %@", [NSThread currentThread]);
    });

    dispatch_sync(backQueue, ^{
        NSLog(@"MAIN 3: %@", [NSThread currentThread]);
    });
    
    // Recursive threads
    
    dispatch_sync(backQueue, ^{
        NSLog(@"DEFAULT 1: %@", [NSThread currentThread]);

        dispatch_async(backQueue, ^{
            NSLog(@"DEFAULT 2: %@", [NSThread currentThread]);

            dispatch_async(queue, ^{
                NSLog(@"DEFAULT 3: %@", [NSThread currentThread]);

                dispatch_async(backQueue, ^{
                    NSLog(@"DEFAULT 4: %@", [NSThread currentThread]);
                });
                NSLog(@"DEFAULT 3-3: %@", [NSThread currentThread]);

            });
            NSLog(@"DEFAULT 2-2: %@", [NSThread currentThread]);
        });
        NSLog(@"DEFAULT 1-1: %@", [NSThread currentThread]);
    });
    
    // Sample with sync-async for main queue
    
    dispatch_async(queue, ^{
        NSLog(@"DEFAULT 1: %@", [NSThread currentThread]);
        NSLog(@"%@", dispatch_get_current_queue());

        [self myOwnMethod];

        NSLog(@"DEFAULT 1-1: %@", [NSThread currentThread]);

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Doing something on the main queue, MAIN thread: %@", [NSThread currentThread]);
            NSLog(@"%@", dispatch_get_current_queue());
        });
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"MAIN: %@", [NSThread currentThread]);

        dispatch_async(queue, ^{
            NSLog(@"NOT MAIN: %@", [NSThread currentThread]);
        });
    });

    dispatch_queue_t newQueue = dispatch_queue_create("ru.shapkindev.lesson.multithreading", DISPATCH_QUEUE_SERIAL);
    
    // NSOperation
    
    NSOperationQueue* q = [[NSOperationQueue alloc] init];
    
    [q addOperationWithBlock:^{
        NSLog(@"some operation");
        NSLog(@"NOT MAIN: %@", [NSThread currentThread]);
        NSLog(@"%@", dispatch_get_current_queue());
    }];
    
    NSLog(@"Finish");
    
    return YES;
}

- (void)testThread:(NSString*) someString {
    
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        for (int i = 0; i < 1000; i++) {
            //NSLog(@"%@ %d %@", someString, i, [NSThread currentThread]);
        }
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        // NSLog(@"%f", CACurrentMediaTime());
        
        // NSObject* obj = [NSObject new];
        // _objc_autoreleasePoolPrint();
    }
    
    // _objc_autoreleasePoolPrint();
    // NSLog(@"%@", [NSThread currentThread]);
}

- (void)myOwnMethod {
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < 2000000; i++) {
        NSObject* obj = [NSObject new];
        [array addObject:obj];
    }
    
    NSLog(@"myOwnMethod is Finished");
}

- (void)addStringToArray:(NSString*) string {
    
    // NSLock* lock = [[NSLock alloc] init];

    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        @synchronized (self) {
            
            NSLog(@"%@ calculation started", [[NSThread currentThread] name]);
            
            for (int i = 0; i < 200; i++) {
                [self.array addObject:string];
            }
            
            NSLog(@"%@ calculation finished", [[NSThread currentThread] name]);
        }

        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}

- (void)printArray {
    NSLog(@"%@", self.array);
    //NSLog(@"%ld", self.array.count);
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
