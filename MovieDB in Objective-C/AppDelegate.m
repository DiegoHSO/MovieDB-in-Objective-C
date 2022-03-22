//
//  AppDelegate.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 21/03/22.
//

#import "AppDelegate.h"
#import "Movie.h"
#import "MovieViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

NSMutableArray *_movies;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // TODO: Instantiate Movie objects
    _movies = [NSMutableArray arrayWithCapacity:3];
    
    Movie *movie1 = [[Movie alloc] init];
    movie1.title = @"Spider-Man: No Way Home";
    movie1.rating = [NSNumber numberWithDouble:9.9];
    movie1.description = @"ABCDE";
    [_movies addObject:movie1];
    
    Movie *movie2 = [[Movie alloc] init];
    movie2.title = @"The Batman";
    movie2.rating = [NSNumber numberWithDouble:9.5];
    movie2.description = @"FGHI";
    [_movies addObject:movie2];
    
    Movie *movie3 = [[Movie alloc] init];
    movie3.title = @"Fast and Furious";
    movie3.rating = [NSNumber numberWithDouble:8.3];
    movie3.description = @"DLNASDJK";
    [_movies addObject:movie3];
    
    Movie *movie4 = [[Movie alloc] init];
    movie4.title = @"ASLKDJLASKD";
    movie4.rating = [NSNumber numberWithDouble:2.0];
    movie4.description = @"";
    [_movies addObject:movie4];
    
    Movie *movie5 = [[Movie alloc] init];
    movie5.title = @"AFLNKADFMDSFDSF";
    movie5.rating = [NSNumber numberWithDouble:1.5];
    movie5.description = @"";
    [_movies addObject:movie5];
    
    Movie *movie6 = [[Movie alloc] init];
    movie6.title = @"Julia: The Movie";
    movie6.rating = [NSNumber numberWithDouble:7.5];
    movie6.description = @"Julia!";
    [_movies addObject:movie6];
    
    UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
    MovieViewController *movieViewController = [navigationController viewControllers][0];
    movieViewController.movies = _movies;
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentCloudKitContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentCloudKitContainer alloc] initWithName:@"MovieDB_in_Objective_C"];
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
