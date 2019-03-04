//
//  DSBoxer.m
//  SK-Lesson-3
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSBoxer.h"

@interface DSBoxer ()
@property (assign, nonatomic) NSInteger nameCount;
@end

@implementation DSBoxer
@synthesize name = _name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameCount = 0;
        self.name = @"Default";
        self.age = 1;
        self.height = 0.52f;
        self.weight = 5.f;
    }
    return self;
}

- (void)setName:(NSString *)name {
    NSLog(@"Setter setName is called");
    _name = [NSString stringWithFormat:@"Boxer: %@", name];
}

- (NSString *)name {
    
    self.nameCount++;
    
    NSLog(@"name getter is called %ld times", self.nameCount);
    return _name;
}

- (NSInteger)age {
    NSLog(@"Are getter is called");
    return _age;
}

- (NSInteger)howOldAreYou {
    return self.age;
}

@end
