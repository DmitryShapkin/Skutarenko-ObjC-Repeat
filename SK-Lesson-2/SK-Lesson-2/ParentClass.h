//
//  ParentClass.h
//  SK-Lesson-2
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParentClass : NSObject

+ (void) whoAreYou;

- (void)sayHello;
- (void)say:(NSString*) someString;
- (void)say:(NSString*) someString and:(NSString*) someStringTwo;
- (void)say:(NSString*) someString and:(NSString*) someStringTwo andAfterThat:(NSString*) someStringThree;
- (NSString*)saySomething;

@end

NS_ASSUME_NONNULL_END
