//
//  ParentClass.m
//  SK-Lesson-2
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ParentClass.h"

@implementation ParentClass

+ (void) whoAreYou {
    NSLog(@"I am ParentClass, %@", self);
}

- (void)sayHello {
    NSLog(@"Parent says hello! %@", self);
}

- (void)say:(NSString*) someString {
    NSLog(@"%@", someString);
}

- (void)say:(NSString*) someString and:(NSString*) someStringTwo {
    NSLog(@"%@, %@", someString, someStringTwo);
}
    
- (void)say:(NSString*) someString and:(NSString*) someStringTwo andAfterThat:(NSString*) someStringThree {
        NSLog(@"%@ %@ %@", someString, someStringTwo, someStringThree);
}

- (NSString*)saySomeNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString*)saySomething {
    NSString* string = [self saySomeNumberString];
    return string;
}

@end
