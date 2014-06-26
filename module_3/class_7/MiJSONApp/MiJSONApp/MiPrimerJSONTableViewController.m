
//
//  MiPrimerJSONTableViewController.m
//  MiJSONApp
//
//  Created by iOS on 6/25/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "MiPrimerJSONTableViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface MiPrimerJSONTableViewController ()

@end

@implementation MiPrimerJSONTableViewController

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


- (IBAction)obtenerJSON:(UIBarButtonItem *)sender {
    
    NSURLRequest *miRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://echo.jsontest.com/respuesta1/Hola/respuesta2/Charizard"]];
    
    AFHTTPRequestOperation *operacion = [[AFHTTPRequestOperation alloc] initWithRequest:miRequest];
    [operacion setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [operacion setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.miRespuesta1Label.text = responseObject[@"respuesta1"];
        self.miRespuesta2Label.text = responseObject[@"respuesta2"];
        
        [self.miImagenView setImageWithURL:[NSURL URLWithString:@"http://www.survivingcollege.com/wp-content/uploads/2013/11/The-Hunger-Games.jpg"]];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error.description);
        
    }];
    
    [operacion start];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
