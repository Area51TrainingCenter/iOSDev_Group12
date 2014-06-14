//
//  ViewController.m
//  MiCoreDataApp
//
//  Created by iOS on 6/9/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "ViewController.h"
#import "Pokemon.h"
#import "Entrenador.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    Pokemon *nuevoPokemon = [Pokemon create];
    nuevoPokemon.nombre = @"Pikachu";
    nuevoPokemon.tipo = @"Electrico";
    
    Entrenador *nuevoEntrenador = [Entrenador create];
    nuevoEntrenador.nombre = @"Ash Ketchum";
    //1
    [nuevoEntrenador addPokemonesObject:nuevoPokemon];
    //2
    nuevoPokemon.entrenador = nuevoEntrenador;

    
    [[IBCoreDataStore mainStore] save];
    
    [Entrenador all];
    NSArray *entrenadores= [Entrenador allOrderedBy:@"nombre" ascending:YES][3];
    
    NSSortDescriptor *soyDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"fechaCreacion" ascending:YES];
    entrenadores = [entrenadores sortedArrayUsingDescriptors:@[soyDescriptor]];
    
    
    
    [Entrenador allOrderedBy:@"fechaCreacion" ascending:YES][4];
    [Entrenador all].count;
    
    
    
    //[Entrenador allForPredicate:[NSPredicate predicateWithFormat:@"c.nombre contains %Ash%"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
