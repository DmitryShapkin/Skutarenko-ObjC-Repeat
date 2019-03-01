//
//  ChildClass.m
//  SK-Lesson-2
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ChildClass.h"

@implementation ChildClass

+ (void)whoAreYou {
    NSLog(@"I am ChildClass");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Child class is created");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%p", self);
    NSLog(@"Child class is deallocated");
}

@end
