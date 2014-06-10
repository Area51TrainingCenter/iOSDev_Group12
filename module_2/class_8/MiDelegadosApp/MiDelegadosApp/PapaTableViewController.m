//
//  PapaTableViewController.m
//  MiDelegadosApp
//
//  Created by iOS on 6/6/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "PapaTableViewController.h"

@interface PapaTableViewController ()

@end

@implementation PapaTableViewController

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


-(void)mostrarAlerta
{
    [CATransaction setCompletionBlock:^{
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:nil message:@"Yeee!" delegate:nil cancelButtonTitle:@"WIN" otherButtonTitles:nil];
        
        [alerta show];
                
    }];
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}


-(void)escribioTexto:(NSString *)nuevoTexto
{
    self.textoHeredadoLabel.text = nuevoTexto;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    HijoTableViewController *destino = segue.destinationViewController;
    destino.miDelegado = self;
    destino.nuevoTexto = self.textoHeredadoLabel.text;
    
    //@[[NSIndexPath indexPathForRow:0 inSection:0]];
}


@end
