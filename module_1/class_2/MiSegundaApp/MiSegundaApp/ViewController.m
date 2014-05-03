//
//  ViewController.m
//  MiSegundaApp
//
//  Created by iOS on 5/2/14.
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

- (IBAction)seApretoCopiar:(UIButton *)sender {
    
    self.resultadoLabel.text = self.miTextField.text;
    
}

- (IBAction)seTecleoMiTextField:(UITextField *)sender {
    
    self.resultadoLabel.text = self.miTextField.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
