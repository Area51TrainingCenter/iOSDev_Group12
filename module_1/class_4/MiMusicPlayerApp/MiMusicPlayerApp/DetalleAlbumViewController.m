//
//  DetalleAlbumViewController.m
//  MiMusicPlayerApp
//
//  Created by iOS on 5/7/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "DetalleAlbumViewController.h"

@interface DetalleAlbumViewController ()

@end

@implementation DetalleAlbumViewController

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
    
    self.resultadoLabel.text = self.dato;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
