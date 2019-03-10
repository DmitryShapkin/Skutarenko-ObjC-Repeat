//
//  DSObject.m
//  SK-Lesson-16 NSDate
//
//  Created by Dmitry Shapkin on 10/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSObject.h"

@interface DSObject ()

@property (strong, nonatomic) NSTimer* timer;

@end

@implementation DSObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"DSObject is initialized");
        
        // Timer
        
        __weak id weakself = self;
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakself selector:@selector(timerTest:) userInfo:nil repeats:YES];
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3]]; // Delaying
        
    }
    return self;
}

- (void)timerTest:(NSTimer*) timer {
    
    NSDateFormatter* anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateFormat:@"hh:mm:ss:SSS"];
    NSLog(@"%@", [anotherDateFormatter stringFromDate:[NSDate date]]);
    
    
}

- (void)dealloc
{
    [self.timer invalidate];
    NSLog(@"DSObject is deallocated");
}

@end
