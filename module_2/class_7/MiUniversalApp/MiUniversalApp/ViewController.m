//
//  ViewController.m
//  MiUniversalApp
//
//  Created by iOS on 6/4/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)seApretoLibrito:(UIBarButtonItem *)sender {
    
    //self.view.backgroundColor= [UIColor blueColor];
    
    /*
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Eliminar" otherButtonTitles:@"Compartir", nil];
    
    [action showFromBarButtonItem:sender animated:YES];
    */
    
    
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:@[@"Real Madrid"] applicationActivities:nil];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        
        [self presentViewController:activity animated:YES completion:nil];
    }
    else
    {
        pop = [[UIPopoverController alloc] initWithContentViewController:activity];
        
        [pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
