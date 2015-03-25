//
//  AppDelegate.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTStarWarsCharacter.h"
#import "AGTCharacterViewController.h"
#import "AGTWikiViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Defino mi pantalla.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];
    
    
    //Creo un combinador
    //TabBar
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    tabVC.viewControllers = [self arrayOfControllers];
    
    //Asignamos rootView
    self.window.rootViewController=tabVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Métodos de apoyo 
-(NSArray *) arrayOfModels{

    NSBundle *b = [NSBundle mainBundle];
    
    NSURL * vaderURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Darth_Vader"];

    NSData * vaderSound = [NSData dataWithContentsOfURL:[b URLForResource:@"vader" withExtension:@"caf"]];
    UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
    
    AGTStarWarsCharacter *vader = [[AGTStarWarsCharacter alloc]
                                   initWithName:@"Anakin Skywalker"
                                   alias:@"DarthVader"
                                   url:vaderURL
                                   soundData:vaderSound
                                   photo:vaderImage];
    
    
    NSURL * chewieURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Chewbacca"];
    NSData * chewieSound = [NSData dataWithContentsOfURL:[b URLForResource:@"chewbacca" withExtension:@"caf"]];
    UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
    
    AGTStarWarsCharacter *chewie = [[AGTStarWarsCharacter alloc]
                                   initWithAlias:@"Chewbacca"
                                   url:chewieURL
                                   soundData:chewieSound
                                   photo:chewieImage];

    
    NSURL * yodaURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Yoda"];
    NSData * yodaSound = [NSData dataWithContentsOfURL:[b URLForResource:@"yoda" withExtension:@"caf"]];
    UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
    
    AGTStarWarsCharacter *yoda = [[AGTStarWarsCharacter alloc]
                                  initWithName:@"Minch Yoda"
                                  alias:@"Master Yoda"
                                  url:yodaURL
                                  soundData:yodaSound
                                  photo:yodaImage];
    
    
    NSURL * c3poURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/C-3PO"];
    NSData * c3poSound = [NSData dataWithContentsOfURL:[b URLForResource:@"c3po" withExtension:@"caf"]];
    UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
    
    AGTStarWarsCharacter *c3po = [[AGTStarWarsCharacter alloc]
                                  initWithAlias:@"C3PO"
                                  url:c3poURL
                                  soundData:c3poSound
                                  photo:c3poImage];
    
    return @[vader,chewie,yoda,c3po];
    
}

-(NSArray *) arrayOfControllers{
    
    NSArray *models = [self arrayOfModels];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:models.count];
    
    //Recorremos array de modelos
    for(AGTStarWarsCharacter *each in models) {
        
        //Creo controller por cada uno
        AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc]initWithModel:each];
        //Meto en navigation
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:charVC];
        //Agrego en array de controllers
        [controllers addObject:nav];
    }
    return controllers;
}



@end
