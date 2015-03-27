//
//  AGTWikiViewController.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 25/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTWikiViewController.h"
#import "AGTUniverseTableViewController.h"

@interface AGTWikiViewController ()

@end

@implementation AGTWikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    //alta notif
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatCharacterDidChange:)
               name:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
             object:nil];
    
    //Asignamos delegados
    self.browser.delegate=self;
    
    //Asegurarse de que no se ocupa toda la pantalla cuando estas en convinador
    self.edgesForExtendedLayout=UIRectEdgeNone;    
    
    //sinc modelo - vista
    [self.activityView setHidesWhenStopped:NO];
    [self.activityView startAnimating];
    
    [self.browser loadRequest:
     [NSURLRequest requestWithURL:self.model.wikiURL]];

}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //baja notif
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Inicializador
-(id) initWithModel:(AGTStarWarsCharacter *) model{
    if(self = [super initWithNibName:nil bundle:nil]) {
        _model=model;
        self.title=@"Wikipedia";
    }
    return self;
}



#pragma mark - Delegate UIViewDelegate
-(BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    if((navigationType==UIWebViewNavigationTypeLinkClicked) ||
       (navigationType==UIWebViewNavigationTypeFormSubmitted)) {
        return NO;
    }else{
        return YES;
    }
    
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //Implementar como ejercicio
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    //paro y oculto activity
    [self.activityView setHidden:YES];
    [self.activityView stopAnimating];
}

#pragma mark - Notifications
// CHARACTER_DID_CHANGE_NOTIFICATION_NAME
-(void)notifyThatCharacterDidChange:(NSNotification*) notification{
    //sacamos personaje
    AGTStarWarsCharacter *character = [notification.userInfo objectForKey:CHARACTER_KEY];
    
    //actualizamos el modelo
    self.model=character;
    
    //sync vista
    [self syncWithModel];
    
}

#pragma mark - Utils
-(void) syncWithModel{
    
    //sinc modelo - vista
    [self.activityView setHidesWhenStopped:NO];
    [self.activityView startAnimating];
    
    [self.browser loadRequest:
     [NSURLRequest requestWithURL:self.model.wikiURL]];
}

@end
