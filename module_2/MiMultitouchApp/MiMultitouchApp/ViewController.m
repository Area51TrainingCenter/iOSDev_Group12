//
//  ViewController.m
//  MiMultitouchApp
//
//  Created by iOS on 23/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
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


-(void)viewWillAppear:(BOOL)animated
{
    coloresOriginales = [NSMutableArray arrayWithObjects:self.primerView.backgroundColor,self.segundoView.backgroundColor, nil];
    
}


- (IBAction)seHizoTap:(UITapGestureRecognizer *)sender {

    sender.view.backgroundColor =[UIColor yellowColor];
    
}


- (IBAction)seHizoDobleTap:(UITapGestureRecognizer *)sender {
    
    sender.view.backgroundColor = coloresOriginales[sender.view.tag];
    
}


- (IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender {
    
    //1. Detectar el movimiento de mi dedo
    
    //1a
    CGPoint punto = [sender locationInView:self.view];
    
    //1b
    CGPoint traslacion = [sender translationInView:self.view];
    
    
    //2. Aplicarselo a la vista
    
    CALayer *miLayer = sender.view.layer;
    miLayer.frame;
    
    
    CGPoint layerPunto =miLayer.position;
    layerPunto.x = 8;
    miLayer.position = layerPunto;
    
    
    int valor=6;
    int copia;
    
    copia = valor;
    copia = 3;
    valor = copia;
    
    
    
    [sender setTranslation:CGPointZero inView:self.view];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
