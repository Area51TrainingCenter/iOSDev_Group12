//
//  Pais.h
//  mundialApp
//
//  Created by iOS on 16/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jugador.h"

@interface Pais : NSObject

@property (strong,nonatomic) NSString *nombre;
@property (strong,nonatomic) NSString *poblacion;
@property (strong,nonatomic) NSString *area;
@property (strong,nonatomic) NSString *idioma;

@property (strong,nonatomic) UIImage *bandera;

@property (strong,nonatomic) NSMutableArray *titulares;
@property (strong,nonatomic) NSMutableArray *suplentes;
@property (strong,nonatomic) Jugador *dt;
@end
