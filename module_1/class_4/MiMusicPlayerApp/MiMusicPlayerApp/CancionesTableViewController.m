//
//  CancionesTableViewController.m
//  MiMusicPlayerApp
//
//  Created by iOS on 5/9/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "CancionesTableViewController.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
