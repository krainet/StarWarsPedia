//
//  AGTWikiViewController.h
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 25/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTStarWarsCharacter.h"
@interface AGTWikiViewController : UIViewController<UIWebViewDelegate>

@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (strong,nonatomic) AGTStarWarsCharacter *model;

-(id) initWithModel:(AGTStarWarsCharacter *) model;

@end
