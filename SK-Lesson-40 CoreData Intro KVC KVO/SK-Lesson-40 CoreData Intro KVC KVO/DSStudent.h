//
//  DSStudent.h
//  SK-Lesson-40 CoreData Intro KVC KVO
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


@import Foundation;


NS_ASSUME_NONNULL_BEGIN

@interface DSStudent : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) NSInteger age;

- (void) changeName;

@end

NS_ASSUME_NONNULL_END
