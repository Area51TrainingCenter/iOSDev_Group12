//
//  Ejercicio1ViewController.m
//  MiAnimacionApp
//
//  Created by iOS on 5/30/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "Ejercicio1ViewController.h"

@interface Ejercicio1ViewController ()

@end

@implementation Ejercicio1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

- (IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender {
    
    CGPoint traslacion = [sender translationInView:self.view];
    CATransform3D miTransform = sender.view.layer.transform;
    
    [CATransaction setAnimationDuration:0];
    miTransform = CATransform3DMakeTranslation(traslacion.x, traslacion.y, 0);
    sender.view.layer.transform = miTransform;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            CATransform3D miTransform = sender.view.layer.transform;
            miTransform = CATransform3DMakeTranslation(0,0, 0);
            sender.view.layer.transform = miTransform;
            
        } completion:nil];
        
        
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
