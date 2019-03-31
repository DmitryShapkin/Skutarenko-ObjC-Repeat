//
//  DSStudent.h
//  SK-Lesson-31 UITableView Editing Part 1
//
//  Created by Dmitry Shapkin on 31/03/2019.
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
