//
//  AppDelegate.m
//  SK-Lesson-40 CoreData Intro KVC KVO
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "AppDelegate.h"
#import "DSStudent.h"
#import "DSGroup.h"


@interface AppDelegate ()

//@property (strong, nonatomic) DSStudent* student;
@property (strong, nonatomic) NSArray* groups;

@end


@implementation AppDelegate

- (void) dealloc
{
    //[self.student removeObserver:self forKeyPath:@"name"];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*
    DSStudent *student = [[DSStudent alloc] init];
     
    [student addObserver:self
              forKeyPath:@"name"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    
    student.name = @"Alex";
    student.age = 20;
    
    NSLog(@"%@", student);
    
    [student setValue:@"Roger" forKey:@"name"];
    [student setValue:@25 forKey:@"age"];
//    [student setAge:30];
    
    NSLog(@"%@", student);
    
    NSLog(@"name1 = %@, name2 = %@", student.name, [student valueForKey:@"name"]);
    
    NSLog(@"%@", student);
    
    [student changeName];
    
    NSLog(@"%@", student);
    
    self.student = student;
     */
    
    DSStudent* student1 = [[DSStudent alloc] init];
    student1.name = @"Alex";
    student1.age = 20;
    
    DSStudent* student2 = [[DSStudent alloc] init];
    student2.name = @"Roger";
    student2.age = 25;
    
    DSStudent* student3 = [[DSStudent alloc] init];
    student3.name = @"Jack";
    student3.age = 22;
    
    DSStudent* student4 = [[DSStudent alloc] init];
    student4.name = @"Vova";
    student4.age = 28;
    
    DSGroup* group1 = [[DSGroup alloc] init];
    group1.students = @[student1, student2, student3, student4];
    
    /*
    NSLog(@"%@", group1.students);
    
    // Так можно удалить объекты из NSArray:
    NSMutableArray* array = [group1 mutableArrayValueForKey:@"students"];
    
    [array removeLastObject];
    
    NSLog(@"%@", group1.students);
    NSLog(@"%@", array);
    */
    
    /*
    self.student = student1;
    
    NSLog(@"name = %@",[self valueForKeyPath:@"student.name"]);
    
    NSString* name = @"Alex111";
    //NSNumber* name = @6;
    
    NSError* error = nil;
    
    if (![self.student validateValue:&name forKey:@"name" error:&error]) {
        NSLog(@"%@", error);
    }
    */
    
    DSStudent* student5 = [[DSStudent alloc] init];
    student5.name = @"Vasya";
    student5.age = 18;
    
    DSStudent* student6 = [[DSStudent alloc] init];
    student6.name = @"Kolya";
    student6.age = 24;
    
    DSGroup* group2 = [[DSGroup alloc] init];
    group2.students = @[student5, student6];
    
    self.groups = @[group1, group2];
    
    // Collection Operators
    
    NSLog(@"groups count %@", [self valueForKeyPath:@"groups.@count"]);
    
    NSArray* allStudents = [self valueForKeyPath:@"groups.@distinctUnionOfArrays.students"];
    
    NSLog(@"all students = %@", allStudents);
    
    NSNumber* minAge = [allStudents valueForKeyPath:@"@min.age"];
    NSNumber* maxAge = [allStudents valueForKeyPath:@"@max.age"];
    NSNumber* sumAge = [allStudents valueForKeyPath:@"@sum.age"];
    NSNumber* avgAge = [allStudents valueForKeyPath:@"@avg.age"];
    
    NSLog(@"minAge = %@", minAge);
    NSLog(@"maxAge = %@", maxAge);
    NSLog(@"sumAge = %@", sumAge);
    NSLog(@"avgAge = %@", avgAge);
    
    NSArray* allNames = [allStudents valueForKeyPath:@"@distinctUnionOfObjects.name"];
    
    NSLog(@"allNames = %@", allNames);
    
    return YES;
}


#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    
    //id value = [change objectForKey:NSKeyValueChangeNewKey];
}

@end
