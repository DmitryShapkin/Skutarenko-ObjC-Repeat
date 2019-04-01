//
//  DSStudent.h
//  SK-Lesson-32 UITableView Editing Part 2
//
//  Created by Dmitry Shapkin on 01/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface DSStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (DSStudent*)randomStudent;

@end

NS_ASSUME_NONNULL_END
