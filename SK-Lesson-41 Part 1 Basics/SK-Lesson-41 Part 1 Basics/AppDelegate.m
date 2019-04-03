//
//  AppDelegate.m
//  SK-Lesson-41 Part 1 Basics
//
//  Created by Dmitry Shapkin on 03/04/2019.
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

    NSError *error = nil;
    
    DSStudent *student = [self addRandomStudent];

    if (![context save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    NSLog(@"%@", student);
    
    /**
     Читаем из Базы Данных
     */
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *description = [NSEntityDescription entityForName:@"DSStudent" inManagedObjectContext:context];
    
    [request setEntity:description];
    
    //[request setResultType:NSDictionaryResultType];
    
    NSLog(@"***");
    
    NSError *requestError = nil;
    
    NSArray *resultArray = [context executeFetchRequest:request error:&requestError];
    
    if (requestError)
    {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    NSLog(@"%@", [resultArray objectAtIndex:0]);
    
//    for (NSManagedObject* object in resultArray)
//    {
//        NSLog(@"%@ %@ - %@", [object valueForKey:@"firstName"], [object valueForKey:@"lastName"], [object valueForKey:@"score"]);
//    }
    
    for (DSStudent* student in resultArray)
    {
        NSLog(@"%@ %@ - %1.2f", student.firstName, student.lastName, student.score);
    }
    
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
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SK_Lesson_41_Part_1_Basics"];
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
