//
//  CancionesTableViewController.m
//  MiMusicPlayerApp
//
//  Created by iOS on 5/9/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "CancionesTableViewController.h"
#import "Cancion.h"

@interface CancionesTableViewController ()

@end

@implementation CancionesTableViewController

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
    
    self.miPosterView.image = self.miAlbum.poster;
    self.miNombreLabel.text = self.miAlbum.titulo;
    self.miAnhoLabel.text = @(self.miAlbum.anho).stringValue;
}


-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.miAlbum.canciones.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *miCelda = [tableView dequeueReusableCellWithIdentifier:@"plantillaCancion"];
    
    /*
    //Metodo 1
    Cancion *soyCancion = self.miAlbum.canciones[indexPath.row];
    miCelda.textLabel.text = soyCancion.titulo;
     */
    
    //Metodo 2
    miCelda.textLabel.text = ((Cancion *)self.miAlbum.canciones[indexPath.row]).titulo;
    
    return miCelda;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Canciones";
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
