//
//  NSString+MyExtension.h
//  SK-Lesson-35
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString ()

+ (NSString *)randomAlphanumericString2
{
    int length = arc4random() % 11 + 5;
    
    return [self randomAlphanumericStringWithLength:length];
}

+ (NSString *)randomAlphanumericStringWithLength2:(NSInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz";//ABCDEFGHIJKLMNOPQRSTUVWXYZ"; //0123456789
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++)
    {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end

NS_ASSUME_NONNULL_END
