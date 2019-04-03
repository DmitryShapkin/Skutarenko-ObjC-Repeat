//
//  DSStudent.m
//  SK-Lesson-40 CoreData Intro KVC KVO
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "DSStudent.h"


@implementation DSStudent

- (void)setName:(NSString *)name
{
    _name = name;
    NSLog(@"student setName: %@", name);
}

- (void)setAge:(NSInteger)age
{
    _age = age;
    NSLog(@"student setAge: %ld", age);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Student: %@ %ld", self.name, self.age];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"Student setValue: %@ forKey: %@", value, key);
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"setValueForUndefinedKey");
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"valueForUndefinedKey");
    return nil;
}

- (void)changeName
{
    [self willChangeValueForKey:@"name"];
    _name = @"FakeName";
    [self didChangeValueForKey:@"name"];
}


- (BOOL)validateValue:(inout id *)ioValue forKey:(NSString *)inKey error:(out NSError **)outError
{
    if ([inKey isEqualToString:@"name"])
    {
        NSString* newName = *ioValue;
        
        if (![newName isKindOfClass:[NSString class]])
        {
            *outError = [[NSError alloc] initWithDomain:@"Not NSString" code:123 userInfo:nil];
            return NO;
        }
        
        if ([newName rangeOfString:@"1"].location != NSNotFound)
        {
            *outError = [[NSError alloc] initWithDomain:@"Has numbers" code:324 userInfo:nil];
            return NO;
        }
    }
    return YES;
}


- (BOOL) validateName:(inout id *)ioValue error:(out NSError **)outError
{
    NSLog(@"AAAAAA");
    return YES;
}


@end
