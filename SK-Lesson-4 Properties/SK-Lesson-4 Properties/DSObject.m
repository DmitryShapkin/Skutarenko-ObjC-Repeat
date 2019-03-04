//
//  DSObject.m
//  SK-Lesson-4 Properties
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSObject.h"

@implementation DSObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"object %@ is deallocated", self);
}

- (id)copyWithZone:(nullable NSZone *)zone {
    
    DSObject *newObject = [[DSObject alloc] init];
    
    newObject.name = self.name;
    
    return newObject;
}

@end
