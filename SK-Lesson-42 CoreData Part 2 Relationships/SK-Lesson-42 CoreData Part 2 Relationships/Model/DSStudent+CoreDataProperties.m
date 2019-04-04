//
//  DSStudent+CoreDataProperties.m
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//
//


#import "DSStudent+CoreDataProperties.h"


@implementation DSStudent (CoreDataProperties)

+ (NSFetchRequest<DSStudent *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:@"DSStudent"];
}

@dynamic firstName;
@dynamic lastName;
@dynamic dateOfBirth;
@dynamic score;
@dynamic car;
@dynamic university;
@dynamic courses;

- (void)setFirstName:(NSString *)firstName
{
    [self willChangeValueForKey:@"firstName"];
    [self setPrimitiveValue:firstName forKey:@"firstName"];
    [self didChangeValueForKey:@"firstName"];
    //NSLog(@"SET FIRST NAME!!!");
}

- (NSString*)firstName
{
    NSString* string = nil;
    [self willAccessValueForKey:@"firstName"];
    string = [self primitiveValueForKey:@"firstName"];
    [self didAccessValueForKey:@"firstName"];
    //NSLog(@"GET FIRST NAME!!!");
    return string;
}

/*
 - (BOOL) validateLastName:(__autoreleasing id *)value error:(NSError *__autoreleasing *)error {
 
 *error = [NSError errorWithDomain:@"BAD LAST NAME" code:123 userInfo:nil];
 
 return NO;
 }*/

@end
