//
//  AGTUniverseTableViewController.h
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 26/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

#import <UIKit/UIKit.h>
#import "AGTStarWarsUniverse.h"
#import "AGTStarWarsCharacter.h"

//Fordward declaration para evitar que el compilador se queje (en el protocolo)
@class AGTUniverseTableViewController;

@protocol AGTUniverseTableViewControllerDelegate <NSObject>

@optional
-(void) universeTableViewController:(AGTUniverseTableViewController*) uVC
                 didSelectCharacter:(AGTStarWarsCharacter*) character;

@end

@interface AGTUniverseTableViewController : UITableViewController

@property (strong,nonatomic) AGTStarWarsUniverse *model;
@property (weak,nonatomic) id<AGTUniverseTableViewControllerDelegate>delegate;

-(id) initWithModel:(AGTStarWarsUniverse*) model style:(UITableViewStyle) style;

@end



