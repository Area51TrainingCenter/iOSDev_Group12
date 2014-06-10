//
//  HijoTableViewController.m
//  MiDelegadosApp
//
//  Created by iOS on 6/6/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "HijoTableViewController.h"

@interface HijoTableViewController ()

@end

@implementation HijoTableViewController

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
    
    self.miTextfield.text = self.nuevoTexto;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.miDelegado mostrarAlerta];
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [self.miDelegado escribioTexto:self.miTextfield.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
