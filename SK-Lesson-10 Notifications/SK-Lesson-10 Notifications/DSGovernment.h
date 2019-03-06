//
//  DSGovernment.h
//  SK-Lesson-10 Notifications
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Unprofessionally:
//static NSString* traLaLa = @"dadadaNotification";

extern NSString* const DSGovernmentTaxLevelDidChangeNotification;
extern NSString* const DSGovernmentSalaryDidChangeNotification;
extern NSString* const DSGovernmentPensionDidChangeNotification;
extern NSString* const DSGovernmentAveragePriceDidChangeNotification;

extern NSString* const DSGovernmentTaxLevelUserInfoKey;
extern NSString* const DSGovernmentSalaryUserInfoKey;
extern NSString* const DSGovernmentPensionUserInfoKey;
extern NSString* const DSGovernmentAveragePriceUserInfoKey;


@interface DSGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end

NS_ASSUME_NONNULL_END
