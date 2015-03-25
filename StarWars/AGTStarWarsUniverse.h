//
//  AGTStarWarsUniverse.h
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 26/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTStarWarsCharacter.h"
@interface AGTStarWarsUniverse : NSObject

@property (nonatomic,readonly) NSUInteger rebelCount;
@property (nonatomic,readonly) NSUInteger imperialCount;

-(AGTStarWarsCharacter *) rebelAtIndex:(NSUInteger) index;
-(AGTStarWarsCharacter *) imperialAtIndex:(NSUInteger) index;

#pragma mark - Inicializador


@end
