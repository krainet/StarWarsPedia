//
//  AGTStarWarsUniverse.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 26/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTStarWarsUniverse.h"

@interface AGTStarWarsUniverse ()

@property (nonatomic,strong) NSArray *rebels;
@property (nonatomic,strong) NSArray *imperials;


@end



@implementation AGTStarWarsUniverse


#pragma mark - Inicializador 
//Sobreescribimos inicializador
-(id) init{
    if(self=[super init]){
        
        //creamos personajes
        
        NSBundle *b = [NSBundle mainBundle];
        
        NSURL * vaderURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Darth_Vader"];
        NSData * vaderSound = [NSData dataWithContentsOfURL:[b URLForResource:@"vader" withExtension:@"caf"]];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        
        AGTStarWarsCharacter *vader = [[AGTStarWarsCharacter alloc]
                                       initWithName:@"Anakin Skywalker"
                                       alias:@"DarthVader"
                                       url:vaderURL
                                       soundData:vaderSound
                                       photo:vaderImage];

        AGTStarWarsCharacter *vader2 = [[AGTStarWarsCharacter alloc]
                                       initWithName:@"Anakin Skywalker"
                                       alias:@"DarthVader"
                                       url:vaderURL
                                       soundData:vaderSound
                                       photo:vaderImage];
        
        
        NSURL * chewieURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Chewbacca"];
        NSData * chewieSound = [NSData dataWithContentsOfURL:[b URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        
        AGTStarWarsCharacter *chewie = [[AGTStarWarsCharacter alloc]
                                        initWithAlias:@"Chewbacca"
                                        url:chewieURL
                                        soundData:chewieSound
                                        photo:chewieImage];
        
        
        NSURL * yodaURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Yoda"];
        NSData * yodaSound = [NSData dataWithContentsOfURL:[b URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        
        AGTStarWarsCharacter *yoda = [[AGTStarWarsCharacter alloc]
                                      initWithName:@"Minch Yoda"
                                      alias:@"Master Yoda"
                                      url:yodaURL
                                      soundData:yodaSound
                                      photo:yodaImage];
        
        
        NSURL * c3poURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/C-3PO"];
        NSData * c3poSound = [NSData dataWithContentsOfURL:[b URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        
        AGTStarWarsCharacter *c3po = [[AGTStarWarsCharacter alloc]
                                      initWithAlias:@"C3PO"
                                      url:c3poURL
                                      soundData:c3poSound
                                      photo:c3poImage];
        
        NSURL * palpatineURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/palpatine"];
        NSData * palpatineSound = [NSData dataWithContentsOfURL:[b URLForResource:@"palpatine" withExtension:@"caf"]];
        UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
        
        AGTStarWarsCharacter *palpatine = [[AGTStarWarsCharacter alloc]
                                      initWithAlias:@"Palpatine"
                                      url:palpatineURL
                                      soundData:palpatineSound
                                      photo:palpatineImage];
        
        
        self.imperials = @[vader,palpatine,vader2];
        self.rebels = @[c3po,yoda,chewie];
        
    }
    return self;
}


#pragma mark - Accessors
//getter personalizado
-(NSUInteger) rebelCount{
    return [self.rebels count];
}

-(NSUInteger) imperialCount{
    return [self.imperials count];
}

-(AGTStarWarsCharacter *) rebelAtIndex:(NSUInteger) index{
    return [self.rebels objectAtIndex:index];
}

-(AGTStarWarsCharacter *) imperialAtIndex:(NSUInteger) index{
    return [self.imperials objectAtIndex:index];
}

@end
