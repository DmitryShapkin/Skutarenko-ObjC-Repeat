//
//  NSString+MyRandom.h
//  SK-Lesson-35
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (MyRandom)

+ (NSString *)randomAlphanumericString;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

@end

NS_ASSUME_NONNULL_END
