//
//  ViewController.m
//  SolucionPractica2App
//
//  Created by iOS on 6/11/14.
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

- (IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender {
    
    CGPoint traslacion = [sender translationInView:self.view];
    
    int meraMeraTraslacion = traslacion.x+ultimaTraslacion;
    
    self.menuIZquierdaView.alpha = meraMeraTraslacion>0;
    self.menuDerechaView.alpha = meraMeraTraslacion<0;
    
    CATransform3D miTransform = sender.view.layer.transform;
    miTransform = CATransform3DMakeTranslation(meraMeraTraslacion, 0, 0);
    sender.view.layer.transform = miTransform;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (ABS(meraMeraTraslacion) < self.view.frame.size.width/2) {
            miTransform = CATransform3DMakeTranslation(0, 0, 0);
            ultimaTraslacion = 0;
        }
        else
        {
            ultimaTraslacion = (meraMeraTraslacion/ABS(meraMeraTraslacion))*260;
            miTransform = CATransform3DMakeTranslation(ultimaTraslacion, 0, 0);
            
        }
        
        [self animarPrincipalConTrasform:miTransform];
        
    }
    
}


-(void)PrincipalApretoBotonIzquierdo
{
    
    if (ultimaTraslacion > 0) {
        [self trasladarPrincipalConTraslacion:0];
    }
    else
    {
        [self trasladarPrincipalConTraslacion:260];
    }
    
}

-(void)PrincipalApretoBotonDerecho
{
    
    if (ultimaTraslacion < 0) {
        [self trasladarPrincipalConTraslacion:0];
    }
    else
    {
        [self trasladarPrincipalConTraslacion:-260];
    }
    
}


-(void)trasladarPrincipalConTraslacion:(int) traslacion
{
    ultimaTraslacion = traslacion;
    
    self.menuIZquierdaView.alpha = ultimaTraslacion>0;
    self.menuDerechaView.alpha = ultimaTraslacion<0;
    
    CATransform3D miTransform = self.principalContainerView.layer.transform;
    miTransform = CATransform3DMakeTranslation(traslacion, 0, 0);
    
    [self animarPrincipalConTrasform:miTransform];
}

-(void)animarPrincipalConTrasform:(CATransform3D)nuevoTransform
{
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.principalContainerView.layer.transform = nuevoTransform;
    } completion:nil];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"principalSegue"]) {
        UINavigationController *navDestino = segue.destinationViewController;
        PrincipalTableViewController *destino = navDestino.viewControllers[0];
        
        destino.miDelegado = self;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
