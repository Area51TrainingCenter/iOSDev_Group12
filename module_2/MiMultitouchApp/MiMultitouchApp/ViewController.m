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

- (IBAction)aparecerMenu:(UIButton *)sender {
    
    UIActionSheet *miMenu = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Eliminar" otherButtonTitles:@"Guardar a carrete",@"Denunciar", nil];
    
    [miMenu showInView:self.view];
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
    
    //2a
    //miLayer.position = punto;
    
    /*
    //2b
    CGPoint nuevaPosicion = miLayer.position;
    nuevaPosicion.x += traslacion.x;
    nuevaPosicion.y += traslacion.y;
    miLayer.position = nuevaPosicion;
    
    [sender setTranslation:CGPointZero inView:self.view];
    */
     
    //3
    CATransform3D nuevoTransform = sender.view.layer.transform;
    nuevoTransform = CATransform3DTranslate(nuevoTransform,traslacion.x, traslacion.y, 0);
    sender.view.layer.transform = nuevoTransform;
    
    [sender setTranslation:CGPointZero inView:self.view];
}


- (IBAction)seEstaHaciendoPinch:(UIPinchGestureRecognizer *)sender {
    
    /*
    CGRect nuevoFrame = sender.view.layer.frame;
    nuevoFrame.size.width *= sender.scale;
    nuevoFrame.size.height *= sender.scale;
    sender.view.layer.frame = nuevoFrame;
   
    sender.scale = 1;
     */
    
    CATransform3D nuevoTransform = sender.view.layer.transform;
    nuevoTransform = CATransform3DScale(nuevoTransform, sender.scale, sender.scale, 1);
    sender.view.layer.transform = nuevoTransform;
    
    sender.scale = 1;

}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
