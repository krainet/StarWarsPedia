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
#import "AGTStarWarsUniverse.h"
#import "AGTUniverseTableViewController.h"
#import "Settings.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Valor por defecto para último personaje seleccionado
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if(![def objectForKey:LAST_SELECTED_CHARACTER]){
        // guardamos un valor por defecto (ojo al empaquetado de los nsnumber dentro de un array (que no puede guardar mas que objetos)
        [def setObject:@[@(IMPERIAL_SECTION),@0]
                forKey:LAST_SELECTED_CHARACTER];
        
        //Por si acaso ... guardamos
        [def synchronize];
    }
    
    //Defino mi pantalla.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor orangeColor];
    
    
    //Creamos Modelo
    AGTStarWarsUniverse *universe = [AGTStarWarsUniverse new];
    
    //Detectar tipo de pantall
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        //tipo tableta
        [self configureForPadWithModel:universe];
    }else{
        //tipo telefono
        [self configureForPhoneWithModel:universe];
    }
    
    
    
    
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

#pragma mark - Utils
-(void) configureForPadWithModel:(AGTStarWarsUniverse*)universe{
    //Creamos los Controladores
    AGTUniverseTableViewController *uVC = [[AGTUniverseTableViewController alloc]initWithModel:universe style:UITableViewStylePlain];
    
    //AGTCharacterViewController *cVC = [[AGTCharacterViewController alloc]initWithModel:[universe rebelAtIndex:0]];
    //lastSelectedCharacterInModel
    AGTCharacterViewController *cVC = [[AGTCharacterViewController alloc]initWithModel:[self lastSelectedCharacterInModel:universe]];
    
    //Creamos los nav controllers
    UINavigationController *uNav = [UINavigationController new];
    [uNav pushViewController:uVC animated:NO];
    
    UINavigationController *cNav = [UINavigationController new];
    [cNav pushViewController:cVC animated:NO];
    
    
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    splitVC.viewControllers=@[uNav,cNav];
    splitVC.delegate=cVC;
    uVC.delegate=cVC;
    
    //Asignamos rootView
    self.window.rootViewController=splitVC;
}

-(void) configureForPhoneWithModel:(AGTStarWarsUniverse*)universe{
    
    
    //Creamos controlador
    AGTUniverseTableViewController *uVC=[[AGTUniverseTableViewController alloc]initWithModel:universe style:UITableViewStylePlain];
    
    //Creamos convinador
    UINavigationController *navVC = [UINavigationController new];
    [navVC pushViewController:uVC animated:NO];
    
    //Asginamos delegados - el delegado somos NOSOTROS MISMOS!
    uVC.delegate=uVC;
    
    
    //Lo hacemos root
    self.window.rootViewController=navVC;
    
    
}

-(AGTStarWarsCharacter*) lastSelectedCharacterInModel:(AGTStarWarsUniverse*)u{
    //obtengo el NSUserDefaults
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //Saco coords del ultimo personaje
    NSArray *coords=[def objectForKey:LAST_SELECTED_CHARACTER];
    NSUInteger section = [[coords objectAtIndex:0] integerValue];
    NSUInteger row = [[coords objectAtIndex:1]integerValue];
    
    //Obtengo el personaje
    AGTStarWarsCharacter *character;
    if(section==IMPERIAL_SECTION){
        //TAL CHAR
        character = [u imperialAtIndex:row];
    } else {
        //TAL OTRO
        character = [u rebelAtIndex:row];
    }
    
    //Lo devuelvo
    return character;
}



@end
