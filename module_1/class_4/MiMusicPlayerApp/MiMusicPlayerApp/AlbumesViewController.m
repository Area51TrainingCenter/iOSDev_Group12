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
#import "Cancion.h"
#import "AlbumCell.h"

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
    Cancion *cancion1 = [[Cancion alloc] init];
    cancion1.titulo = @"Eye of The Tiger";
    
    Cancion *cancion2 = [[Cancion alloc] init];
    cancion2.titulo = @"Happy";
    
    Cancion *cancion3 = [[Cancion alloc] init];
    cancion3.titulo = @"Don't stop me now";
    
    
    Album *album1 = [[Album alloc] init];
    album1.titulo = @"Teenage Dream";
    album1.artista = @"Katy Perry";
    album1.anho = 2009;
    album1.canciones = @[cancion1,cancion2,cancion3]; //[NSArray array]; //[[NSArray alloc] init];
    album1.poster = [UIImage imageNamed:@"cover1"];
    
    /////////////////
    
    
    Cancion *cancion10 = [[Cancion alloc] init];
    cancion10.titulo = @"Teletubies Opening";
    
    Cancion *cancion11 = [[Cancion alloc] init];
    cancion11.titulo = @"Pegasus fantasy";
    
    
    Album *album2 = [[Album alloc] init];
    album2.titulo = @"Variaditas";
    album2.artista = @"El General";
    album2.anho = 2016;
    album2.canciones = @[cancion10,cancion11]; //[NSArray array]; //[[NSArray alloc] init];
    album2.poster = [UIImage imageNamed:@"cover1"];
    
    albumes = @[album1,album2];
    
    ///////////
    
    NSString *rutaPlist = [[NSBundle mainBundle] pathForResource:@"GruposList" ofType:@"plist"];
    
    NSArray *gruposPlist = [NSArray arrayWithContentsOfFile:rutaPlist];
    
    NSDictionary *primerGrupo = gruposPlist[0];
    primerGrupo[@"nombre"];
    
    for (NSDictionary *soyGrupo in gruposPlist) {
        
        Grupo *grupoObjeto = [[Grupo alloc] init];
        grupoObjeto.nombre = soyGrupo[@"nombre"];
        
        
        [gruposMeroMero add:bvbgrupoObjeto];
    }
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
}


-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return albumes.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"plantillaAlbum"];
    
    Album *soyAlbum = albumes[indexPath.row];
    
    cell.tituloLabel.text = soyAlbum.titulo;
    cell.anhoLabel.text = @(soyAlbum.anho).stringValue;
    cell.numCancionesLabel.text = [NSString stringWithFormat:@"%d canciones",soyAlbum.canciones.count];
    cell.posterView.image = soyAlbum.poster;
    
    
    return cell;
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

/*
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
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cancionesSegue"]) {
        
        CancionesTableViewController *destino = segue.destinationViewController;
        
        Album *albumSeleccionado = albumes[self.tableView.indexPathForSelectedRow.row];
        
        
        destino.miAlbum = albumSeleccionado;
        
    }
    
    
    
    
}

@end
