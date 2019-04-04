//
//  AppDelegate.m
//  SK-Lesson-42 CoreData Part 2 Relationships
//
//  Created by Dmitry Shapkin on 04/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "AppDelegate.h"
#import "DSStudent+CoreDataClass.h"


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
    
    student.firstName = firstNames[arc4random() % 50];
    student.lastName = lastNames[arc4random() % 50];
    student.dateOfBirth =
    [NSDate dateWithTimeIntervalSinceNow:-(60 * 60 * 24 * 365 * ((arc4random() % 15) + 18))];
    
    student.score = ((double)(arc4random_uniform(201)) / 200.f) + 2;
    
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
    
    car.model = carModelNames[arc4random_uniform(10)];
    
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
            DSCar* car = (DSCar*) object;
            NSLog(@"CAR: %@ OWNER: %@ %@", car.model, car.owner.firstName, car.owner.lastName);
        }
        else if ([object isKindOfClass:[DSStudent class]])
        {
            DSStudent* student = (DSStudent*) object;
            NSLog(@"STUDENT: %@ %@, CAR: %@, UNIVERSITY: %@",
                  student.firstName, student.lastName, student.car.model, student.university.name);
        }
        else if ([object isKindOfClass:[DSUniversity class]])
        {
            DSUniversity* university = (DSUniversity*) object;
            NSLog(@"UNIVERSITY: %@ Students: %ld", university.name, [university.students count]);
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
    
    NSLog(@"\n\n\n\n\n*** *** ***");

    NSError* error = nil;

    DSUniversity* university = [self addUniversity];

    for (int i = 0; i < 30; i++)
    {
        DSStudent* student = [self addRandomStudent];

        if (arc4random_uniform(1000) < 500)
        {
            DSCar* car = [self addRandomCar];
            student.car = car;
        }

        student.university = university;

        //[university addStudentsObject:student];
    }

    if (![context save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }

    //[self deleteAllObjects];

    [self printAllObjects];
    
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
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SK_Lesson_42_CoreData_Part_2_Relationships"];
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
