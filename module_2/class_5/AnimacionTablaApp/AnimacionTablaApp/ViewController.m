//
//  ViewController.m
//  AnimacionTablaApp
//
//  Created by iOS on 6/2/14.
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


- (IBAction)accionAutolayout:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        //self.miEspacioVertical.constant += 80;
        self.altoRojo.constant += 70;
        [self.view layoutIfNeeded];
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
