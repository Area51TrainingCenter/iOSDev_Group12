//
//  AlbumesViewController.m
//  MiMusicPlayerApp
//
//  Created by iOS on 5/7/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "AlbumesViewController.h"
#import "DetalleAlbumViewController.h"
#import "CancionesTableViewController.h"

@interface AlbumesViewController ()

@end

@implementation AlbumesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    album1 = [[Album alloc] init];
    album1.titulo = @"Teenage Dream";
    album1.artista = @"Katy Perry";
    album1.anho = 2009;
    album1.canciones = @[]; //[NSArray array]; //[[NSArray alloc] init];
    album1.poster = [UIImage imageNamed:@"cover1"];
}


-(void)viewWillAppear:(BOOL)animated
{
    self.tituloAlbumLabel.text = album1.titulo;
    self.anhoAlbumLabel.text = [self pasarAString:album1.anho];
    self.numCancionesAlbumLabel.text = [self pasarAString:album1.canciones.count];
    self.posterAlbumView.image = album1.poster;
}


-(NSString *)pasarAString:(int)numero
{
    return [NSString stringWithFormat:@"%d",numero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{

    if ([identifier isEqualToString:@"detalleAlbumSegue"]) {
        NSCharacterSet *espaciosEnBlanco = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSString *textoTrimeado = [self.albumTextField.text stringByTrimmingCharactersInSet:espaciosEnBlanco];
        
        if (textoTrimeado.length >0) {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else if(0)
    {
        return  9;
    }
    else
    {
        return YES;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cancionesSegue"]) {
        
        CancionesTableViewController *destino = segue.destinationViewController;
        destino.miAlbum = album1;
        
    }
    else
    {
        DetalleAlbumViewController *destino = segue.destinationViewController;
        destino.dato = self.albumTextField.text;
    }
    
    
    
    
}

@end
