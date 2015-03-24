//
//  AGTCharacterViewController.h
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

//#import <UIKit/UIKit.h>

@import UIKit;
#import "AGTStarWarsCharacter.h"

@interface AGTCharacterViewController : UIViewController

@property (nonatomic,strong) AGTStarWarsCharacter *model;
@property (weak,nonatomic) IBOutlet UIImageView *photoView;

-(id) initWithModel:(AGTStarWarsCharacter *) model;

@end
