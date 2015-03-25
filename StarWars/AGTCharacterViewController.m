//
//  AGTCharacterViewController.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTCharacterViewController.h"
#import "CafPlayer.h"
#import "AGTWikiViewController.h"

@implementation AGTCharacterViewController

#pragma mark - Init
-(id) initWithModel:(AGTStarWarsCharacter *) model{
    if(self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
        self.title = [model alias];
    }
    return self;
}

#pragma mark - Lifecycle Controller
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Asegurarse de que no se ocupa toda la pantalla cuando estas en convinador
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    //Syncronizamos modelo -> vista
    self.photoView.image=self.model.photo;
}


#pragma mark Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions
-(IBAction)playSound:(id)sender{
    //Sacamos sonido del modelo y reproducimos
    // Lo reproducimos
    //CafPlayer *player = [CafPlayer cafPlayer];
    //[player playSoundData:self.model.soundData];
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
}

-(IBAction)displayWiki:(id)sender{
    //crear wikiVC y hacer push
    AGTWikiViewController *wVC = [[AGTWikiViewController alloc]initWithModel:self.model];
    
    //Hacer un push al navigation controller
    [self.navigationController pushViewController:wVC
                                         animated:YES];
}



@end
