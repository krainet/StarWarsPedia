//
//  AGTStarWarsCharacter.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 24/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTStarWarsCharacter.h"

@implementation AGTStarWarsCharacter

#pragma mark Inicializadores

//Inicializador designado
-(id) initWithName:(NSString*) name
             alias:(NSString *) alias
               url:(NSURL *) wikiURL
         soundData:(NSData *) soundData
             photo:(UIImage *) photo{
    
    if(self=[super init]) {
        _name = name;
        _alias=alias;
        _wikiURL=wikiURL;
        _soundData=soundData;
        _photo=photo;
    }
    
    return self;
}

//Inicializador de conveniencia
-(id) initWithAlias:(NSString*) alias
                url:(NSURL *) wikiURL
          soundData:(NSData *) soundData
              photo:(UIImage *) photo{
    
    return [self initWithName:nil alias:alias url:wikiURL soundData:soundData photo:photo];
}


@end
