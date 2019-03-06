//
//  AppDelegate.h
//  SK-Lesson-11 Selectors
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// how to create property for selector
@property (assign, nonatomic) SEL select;


@end

