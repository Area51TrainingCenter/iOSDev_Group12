//
//  AlbumesViewController.m
//  MiMusicPlayerApp
//
//  Created by iOS on 5/7/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "AlbumesViewController.h"
#import "DetalleAlbumViewController.h"

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
    DetalleAlbumViewController *destino = segue.destinationViewController;
    destino.dato = self.albumTextField.text;
    
    
}

@end
