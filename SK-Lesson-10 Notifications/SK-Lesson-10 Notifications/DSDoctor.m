//
//  DSDoctor.m
//  SK-Lesson-10 Notifications
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSDoctor.h"
#import "DSGovernment.h"

@implementation DSDoctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangedNotification:)
                                                     name:DSGovernmentSalaryDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:DSGovernmentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

-(void)salaryChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:DSGovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary) {\
        NSLog(@"Old salary: %f New salary: %f", self.salary, salary);
        NSLog(@"Doctors are NOT happy");
    } else {
        NSLog(@"Old salary: %f New salary: %f", self.salary, salary);
        NSLog(@"Doctors are happy");
    }
    
    self.salary = salary;
}

-(void)averagePriceChangedNotification:(NSNotification*) notification {
    // string
}

@end
