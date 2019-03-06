//
//  DSGovernment.m
//  SK-Lesson-10 Notifications
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSGovernment.h"

NSString* const DSGovernmentTaxLevelDidChangeNotification = @"DSGovernmentTaxLevelDidChangeNotification";
NSString* const DSGovernmentSalaryDidChangeNotification = @"DSGovernmentSalaryDidChangeNotification";
NSString* const DSGovernmentPensionDidChangeNotification = @"DSGovernmentPensionDidChangeNotification";
NSString* const DSGovernmentAveragePriceDidChangeNotification = @"DSGovernmentAveragePriceDidChangeNotification";

NSString* const DSGovernmentTaxLevelUserInfoKey = @"DSGovernmentTaxLevelUserInfoKey";
NSString* const DSGovernmentSalaryUserInfoKey = @"DSGovernmentSalaryUserInfoKey";
NSString* const DSGovernmentPensionUserInfoKey = @"DSGovernmentPensionUserInfoKey";
NSString* const DSGovernmentAveragePriceUserInfoKey = @"DSGovernmentAveragePriceUserInfoKey";

@implementation DSGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10.f;
    }
    return self;
}

- (void)setTaxLevel:(CGFloat)taxLevel {
    
    _taxLevel = taxLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:DSGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DSGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void)setSalary:(CGFloat)salary {
    
    _salary = salary;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:DSGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DSGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void)setPension:(CGFloat)pension {
    
    _pension = pension;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:DSGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DSGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void)setAveragePrice:(CGFloat)averagePrice {
    
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:DSGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DSGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

@end
