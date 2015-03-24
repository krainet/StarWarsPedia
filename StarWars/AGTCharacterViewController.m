//
//  AGTCharacterViewController.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTCharacterViewController.h"


@implementation AGTCharacterViewController

-(id) initWithModel:(AGTStarWarsCharacter *) model{
    if(self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Syncronizamos modelo -> vista
    self.photoView.image=self.model.photo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
