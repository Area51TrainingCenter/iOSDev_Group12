//
//  DetalleEntrenadorTableViewController.h
//  MiCoreDataApp
//
//  Created by iOS on 6/16/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entrenador.h"
#import "Pokemon.h"


@interface DetalleEntrenadorTableViewController : UITableViewController
{
    NSArray *pokemones;
}


@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexoLabel;
@property (weak, nonatomic) IBOutlet UILabel *puebloOrigenLabel;
@property (weak, nonatomic) IBOutlet UILabel *numPokemonesLabel;


@property (strong,nonatomic) Entrenador *miEntrenador;


@end
