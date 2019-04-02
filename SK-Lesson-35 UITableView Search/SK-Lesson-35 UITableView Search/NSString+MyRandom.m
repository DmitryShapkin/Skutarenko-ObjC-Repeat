//
//  NSString+MyRandom.m
//  SK-Lesson-35
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "NSString+MyRandom.h"

@implementation NSString (MyRandom)

+ (NSString *)randomAlphanumericString
{
    int length = arc4random() % 11 + 5;
    
    return [self randomAlphanumericStringWithLength:length];
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length
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
