//
//  AGTWikiViewController.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 25/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTWikiViewController.h"

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
    
    //Asignamos delegados
    self.browser.delegate=self;
    
    //sinc modelo - vista
    [self.activityView setHidesWhenStopped:NO];
    [self.activityView startAnimating];
    
    [self.browser loadRequest:
     [NSURLRequest requestWithURL:self.model.wikiURL]];
}



-(id) initWithModel:(AGTStarWarsCharacter *) model{
    if(self = [super initWithNibName:nil bundle:nil]) {
        _model=model;
    }
    return self;
}

#pragma mark - Delegate UIViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    //paro y oculto activity
    [self.activityView setHidden:YES];
    [self.activityView stopAnimating];
}

@end
