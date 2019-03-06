//
//  DSDancer.m
//  SK-Lesson-7 Protocols
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSDancer.h"

@implementation DSDancer

- (void)dance {
    
}

#pragma mark - PatientProtocol

- (BOOL)areYouOk {
    BOOL isOk = arc4random() % 2;
    NSLog(@"%@ are you ok? %@", [self class], isOk ? @"YES" : @"NO");
    return isOk;
}

- (void)makeShot {
    NSLog(@"%@ makes a shot", [self class]);
}

- (void)takePill {
    NSLog(@"%@ takes a pill", [self class]);
}

@end
