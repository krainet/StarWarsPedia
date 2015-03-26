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



@interface AGTUniverseTableViewController : UITableViewController

@property (strong,nonatomic) AGTStarWarsUniverse *model;

-(id) initWithModel:(AGTStarWarsUniverse*) model style:(UITableViewStyle) style;

@end
