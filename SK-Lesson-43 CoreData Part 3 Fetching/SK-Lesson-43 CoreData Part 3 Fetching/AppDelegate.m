//
//  AppDelegate.m
//  SK-Lesson-43 CoreData Part 3 Fetching
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "AppDelegate.h"
//#import "DSStudent+CoreDataClass.h"


@interface AppDelegate ()

@end

static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

static NSString* carModelNames[] = {
    @"Ferrari", @"Maseratti", @"Lada", @"Renault", @"BMW",
    @"Mercedes", @"Volvo", @"Zaporozhets", @"Toyota", @"Mitsubishi"
};


@implementation AppDelegate

- (DSStudent*) addRandomStudent
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
    DSStudent *student = [NSEntityDescription
                          insertNewObjectForEntityForName:@"DSStudent"
                          inManagedObjectContext:context];
    
    student.score = @((float)arc4random_uniform(201) / 100.f + 2.f);
    student.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:60 * 60 * 24 * 365 * arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(50)];
    student.lastName = lastNames[arc4random_uniform(50)];
    
    //    NSError *error = nil;
    //    if (![context save:&error]) {
    //        NSLog(@"%@", [error localizedDescription]);
    //    }
    
    return student;
}

- (DSCar*)addRandomCar
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
    DSCar *car = [NSEntityDescription
                  insertNewObjectForEntityForName:@"DSCar"
                  inManagedObjectContext:context];
    
    car.model = carModelNames[arc4random_uniform(5)];
    
    return car;
}

- (DSUniversity*)addUniversity
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
    DSUniversity* university =
    [NSEntityDescription insertNewObjectForEntityForName:@"DSUniversity" inManagedObjectContext:context];
    university.name = @"STANFORD";
    return university;
}

- (DSCourse*)addCourseWithName:(NSString*)name
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
    DSCourse* course =
    [NSEntityDescription insertNewObjectForEntityForName:@"DSCourse"  inManagedObjectContext:context];
    course.name = name;
    return course;
}

- (NSArray*)allObjects
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"DSObject" inManagedObjectContext:context];
    [request setEntity:description];
    NSLog(@"***");
    NSError *requestError = nil;
    NSArray *resultArray = [context executeFetchRequest:request error:&requestError];
    if (requestError)
    {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    return resultArray;
}

- (void)printAllObjects
{
    NSArray *allObjects = [self allObjects];
    
    for (id object in allObjects)
    {
        if ([object isKindOfClass:[DSCar class]])
        {
            DSCar* car = (DSCar*)object;
            NSLog(@"CAR: %@ OWNER: %@ %@", car.model, car.owner.firstName, car.owner.lastName);
        }
        else if ([object isKindOfClass:[DSStudent class]])
        {
            DSStudent* student = (DSStudent*)object;
            NSLog(@"STUDENT: %@ %@, SCORE: %1.2f, COURSES: %lu",
                  student.firstName, student.lastName,
                  [student.score floatValue], [student.courses count]);
        }
        else if ([object isKindOfClass:[DSUniversity class]])
        {
            DSUniversity* university = (DSUniversity*)object;
            NSLog(@"UNIVERSITY: %@ Students: %ld", university.name, [university.students count]);
            
        }
        else if ([object isKindOfClass:[DSCourse class]])
        {
            DSCourse* course = (DSCourse*)object;
            NSLog(@"COURSE: %@ Students: %lu", course.name, [course.students count]);
        }
        //NSLog(@"%@", object);
    }
}

- (void)deleteAllObjects
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSArray *allObjects = [self allObjects];
    
    for (id object in allObjects)
    {
        [context deleteObject:object];
    }
    [context save:nil];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *containerName = self.persistentContainer.name;
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSManagedObjectModel *objectModel = self.persistentContainer.managedObjectModel;
    NSPersistentStoreCoordinator *storeCoordinator = self.persistentContainer.persistentStoreCoordinator;
    NSArray *persistantDescription = self.persistentContainer.persistentStoreDescriptions;
    
    NSLog(@"%@", containerName);
    NSLog(@"%@", context);
    NSLog(@"%@", objectModel);
    NSLog(@"%@", [objectModel entitiesByName]);
    NSLog(@"%@", storeCoordinator);
    NSLog(@"%@", persistantDescription);
    
    /**
     SK-Lesson-43
     Работа с курсами + Fetching
     */
    
    NSError* error = nil;
    
    NSArray* courses = @[[self addCourseWithName:@"iOS"],
                         [self addCourseWithName:@"Android"],
                         [self addCourseWithName:@"PHP"],
                         [self addCourseWithName:@"Javascript"],
                         [self addCourseWithName:@"HTML"]];
    
    DSUniversity* university = [self addUniversity];
    
    [university addCourses:[NSSet setWithArray:courses]];
    
    for (int i = 0; i < 100; i++) {
        
        DSStudent* student = [self addRandomStudent];
        
        if (arc4random_uniform(1000) < 500) {
            DSCar* car = [self addRandomCar];
            student.car = car;
        }
        
        student.university = university;
        
        NSInteger number = arc4random_uniform(5) + 1;
        
        while ([student.courses count] < number) {
            DSCourse* course = [courses objectAtIndex:arc4random_uniform(5)];
            if (![student.courses containsObject:course]) {
                [student addCoursesObject:course];
            }
        }
    }
    
    if (![context save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    
    /**
     Запись в Базу Данных
     */
    
    //    NSManagedObject *student = [NSEntityDescription insertNewObjectForEntityForName:@"DSStudent" inManagedObjectContext:context];
    //
    //    NSLog(@"%@", student);
    //
    //    [student setValue:@"Dmitry" forKey:@"firstName"];
    //    [student setValue:@"Shapkin" forKey:@"lastName"];
    //    [student setValue:[NSDate dateWithTimeIntervalSinceReferenceDate:0] forKey:@"dateOfBirth"];
    //    [student setValue:[NSNumber numberWithDouble:3.96] forKey:@"score"];
    //
    //    NSLog(@"%@", student);
    //
    //    // Непосредственно сохранение контекста в Базу Данных
    //
    //    NSError *error = nil;
    //
    //    if (![context save:&error]) {
    //        NSLog(@"%@", [error localizedDescription]);
    //    }
    //
    //    NSLog(@"%@", student);
    
    
    /**
     Создаём студента и присваиваем ему машину.
     Записываем в БД
     */
    //
    //    NSLog(@"\n\n\n\n\n*** *** ***");
    //
    //    NSError *error = nil;
    //
    //    DSStudent *student = [self addRandomStudent];
    //    DSCar *car = [self addRandomCar];
    //
    //    student.car = car;
    //
    //    if (![context save:&error]) {
    //        NSLog(@"%@", [error localizedDescription]);
    //    }
    //
    //    [self printAllObjects];
    
    /**
     Проверка зависимостей (Relationships) при удалении
     Удалим первую машину из массива
     */
    
    //    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //
    //    NSEntityDescription *description = [NSEntityDescription entityForName:@"DSCar" inManagedObjectContext:context];
    //
    //    [request setEntity:description];
    //
    //    NSLog(@"***");
    //
    //    NSError *requestError = nil;
    //
    //    NSArray *resultArray = [context executeFetchRequest:request error:&requestError];
    //
    //    if ([resultArray count] > 0)
    //    {
    //        DSCar *car = [resultArray firstObject];
    //        [context deleteObject:car];
    //        [context save:nil];
    //    }
    //
    //    [self printAllObjects];
    
    
    
    /**
     Читаем из Базы Данных
     */
    
    //    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //
    //    NSEntityDescription *description = [NSEntityDescription entityForName:@"DSStudent" inManagedObjectContext:context];
    //
    //    [request setEntity:description];
    //
    //    //[request setResultType:NSDictionaryResultType];
    //
    //    NSLog(@"***");
    //
    //    NSError *requestError = nil;
    //
    //    NSArray *resultArray = [context executeFetchRequest:request error:&requestError];
    //
    //    if (requestError)
    //    {
    //        NSLog(@"%@", [requestError localizedDescription]);
    //    }
    //
    //    NSLog(@"%@", [resultArray objectAtIndex:0]);
    
    //    for (NSManagedObject* object in resultArray)
    //    {
    //        NSLog(@"%@ %@ - %@", [object valueForKey:@"firstName"], [object valueForKey:@"lastName"], [object valueForKey:@"score"]);
    //    }
    //
    //    for (DSStudent* student in resultArray)
    //    {
    //        NSLog(@"%@ %@ - %1.2f", student.firstName, student.lastName, student.score);
    //    }
    
    
    /**
     Добавляем университет и рандомно заполняем студентами
     */
    
//    NSLog(@"\n\n\n\n\n*** *** ***");
//
//    NSError* error = nil;
//
//    DSUniversity* university = [self addUniversity];
//
//    for (int i = 0; i < 30; i++)
//    {
//        DSStudent* student = [self addRandomStudent];
//
//        if (arc4random_uniform(1000) < 500)
//        {
//            DSCar* car = [self addRandomCar];
//            student.car = car;
//        }
//
//        student.university = university;
//
//        //[university addStudentsObject:student];
//    }
//
//    if (![context save:&error]) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
//
//    //[self deleteAllObjects];
//
//    [self printAllObjects];
    
    /**
     Удалим университет и посмотрим сохранятся ли студенты
     */
    
    //    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    //
    //    NSEntityDescription* description =
    //    [NSEntityDescription entityForName:@"DSUniversity"
    //                inManagedObjectContext:context];
    //
    //    [request setEntity:description];
    //
    //    NSError* requestError = nil;
    //    NSArray* resultArray = [context executeFetchRequest:request error:&requestError];
    //
    //    if ([resultArray count] > 0) {
    //
    //        DSUniversity* university = [resultArray firstObject];
    //
    //        NSLog(@"university to delete %@", university);
    //
    //        [context deleteObject:university];
    //        [context save:nil];
    //    }
    //
    //    [self printAllObjects];
    //
    
    
    /**
     FETCHING
     */
    
     /*
     NSFetchRequest* request = [[NSFetchRequest alloc] init];
     
     NSEntityDescription* description =
     [NSEntityDescription entityForName:@"ASCourse"
     inManagedObjectContext:self.managedObjectContext];
     
     [request setEntity:description];
     */
    //[request setRelationshipKeyPathsForPrefetching:@[@"courses"]];
    
    /*
     NSSortDescriptor* firstNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
     
     NSSortDescriptor* lastNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
     
     [request setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
     */
    
    /*
     NSSortDescriptor* nameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
     
     [request setSortDescriptors:@[nameDescriptor]];
     */
    //NSArray* validNames = @[@"Clyde", @"Pam", @"Rosanna"];
    
    /*
     NSPredicate* predicate =
     [NSPredicate predicateWithFormat:
     @"score > %f AND score <= %f AND "
     "courses.@count >= %d AND "
     "firstName IN %@", 3.0, 3.5, 3, validNames];
     */
    //NSPredicate* predicate = [NSPredicate predicateWithFormat:@"@max.students.score > %f", 3.9];
    
    /*
     NSPredicate* predicate =
     [NSPredicate predicateWithFormat:@"SUBQUERY(students, $student, $student.car.model == %@).@count >= %d", @"BMW", 6];
     
     [request setPredicate:predicate];
     */
    
    /*
     [request setFetchBatchSize:20];
     
     NSError* requestError = nil;
     NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
     
     [self printArray:resultArray];
     */
    
    /*
     NSFetchRequest* request = [[self.managedObjectModel fetchRequestTemplateForName:@"FetchStudents"] copy];
     
     NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
     
     NSSortDescriptor* firstNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
     
     NSSortDescriptor* lastNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
     
     [request setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
     
     [self printArray:resultArray];
     */
    
//    NSFetchRequest* request = [[NSFetchRequest alloc] init];
//
//    NSEntityDescription* description =
//    [NSEntityDescription entityForName:@"ASCourse"
//                inManagedObjectContext:self.managedObjectContext];
//
//    [request setEntity:description];
//
//    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
//
//    for (ASCourse* course in resultArray) {
//
//        NSLog(@"COURSE NAME = %@", course.name);
//        NSLog(@"BEST STUDENTS:");
//        [self printArray:course.bestStudents];
//        NSLog(@"BUZY STUDENTS:");
//        [self printArray:course.studentsWithManyCourses];
//    }
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SK_Lesson_43_CoreData_Part_3_Fetching"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
