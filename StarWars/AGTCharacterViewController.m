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
    [self syncViewWithModel];
    //refactorizo :: self.photoView.image=self.model.photo;
    
    //BUG boton al aparecer - si estoy dentro de un splitvc pongo boton
    self.navigationItem.leftBarButtonItem=self.splitViewController.displayModeButtonItem;
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

#pragma mark - Delegate UISplitViewController
-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    //DEBERES: REVISAR MODOS
    
    //Averiguar si la tabla se ve o no
    if(displayMode==UISplitViewControllerDisplayModePrimaryHidden){
        //tabla oculta
        //Ponemos boton en mi barra de navegacion
        self.navigationItem.leftBarButtonItem=svc.displayModeButtonItem;
    } else {
        // se muestra la tabla, y oculto el boton de la barra de navegacion
        self.navigationItem.leftBarButtonItem=nil;
    }
    
}


#pragma mark - AGTUniverseTableViewControllerDelegate
//Tambien es delegado del tableViewController (pringado)

-(void)universeTableViewController:(AGTUniverseTableViewController *)uVC
                didSelectCharacter:(AGTStarWarsCharacter *)character{
    
    //Actualizo el modelo
    self.model=character;
    
    //Sincronizo modelo y vista
    [self syncViewWithModel];
    
}

-(void) syncViewWithModel{
    self.title=self.model.alias;
    self.photoView.image=self.model.photo;
}

@end
