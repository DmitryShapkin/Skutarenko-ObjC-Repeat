//
//  DSObject.m
//  SK-Lesson-12 Blocks
//
//  Created by Dmitry Shapkin on 07/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSObject.h"

@interface DSObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end

@implementation DSObject

- (void)testMethod:(ObjectBlock) block {
    block();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"DSObject is initialized");
        
        __weak DSObject* weakSelf = self;
        
        self.objectBlock = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"DSObject is deallocated");
}

@end
