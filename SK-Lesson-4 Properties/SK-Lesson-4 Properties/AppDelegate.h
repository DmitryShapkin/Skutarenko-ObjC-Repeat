//
//  AppDelegate.h
//  SK-Lesson-4 Properties
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "DSObject.h"

@class DSObject;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (copy, nonatomic, getter = getObject, setter = setShmetObject:) DSObject *object;

@end

