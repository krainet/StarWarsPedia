//
//  AGTCharacterViewController.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTCharacterViewController.h"
#import "CafPlayer.h"

@implementation AGTCharacterViewController

#pragma mark - Init
-(id) initWithModel:(AGTStarWarsCharacter *) model{
    if(self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    return self;
}

#pragma mark - Lifecycle Controller
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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



@end
