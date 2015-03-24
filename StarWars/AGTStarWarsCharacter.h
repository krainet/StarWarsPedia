//
//  AGTStarWarsCharacter.h
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

//Forma antigua de importar frameworks
#import <Foundation/Foundation.h>

//Forma nueva de importar frameworks (como modulos)
@import Foundation;
@import UIKit;

@interface AGTStarWarsCharacter : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *alias;
@property (strong,nonatomic) NSURL *wikiURL;
@property (strong,nonatomic) NSData *soundData;
@property (strong,nonatomic) UIImage *photo;


#pragma mark Inicializadores

// Inicializador designado
-(id) initWithName:(NSString*) name
             alias:(NSString *) alias
               url:(NSURL *) wikiURL
         soundData:(NSData *) soundData
             photo:(UIImage *) photo;

// Inicializador de conveniencia
-(id) initWithAlias:(NSString*) alias
                url:(NSURL *) wikiURL
          soundData:(NSData *) soundData
              photo:(UIImage *) photo;


@end
