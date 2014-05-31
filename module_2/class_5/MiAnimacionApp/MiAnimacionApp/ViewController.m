//
//  ViewController.m
//  MiAnimacionApp
//
//  Created by iOS on 5/30/14.
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


-(void)viewDidAppear:(BOOL)animated
{
    self.miCuadradito.layer.delegate = self;
    
    //self.beyonceView.clipsToBounds = YES;
    self.beyonceView.layer.cornerRadius = 50;

}


- (IBAction)accionUIViewAnimation:(UIButton *)sender {
    
    [UIView animateWithDuration:1 animations:^{
        
        //self.miCuadradito.alpha = 0;
        //self.miCuadradito.backgroundColor = [UIColor blueColor];
    }];
    
}


- (IBAction)accionCoreAnimation:(UIButton *)sender {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:5];
    [CATransaction setCompletionBlock:^{
        
        [CATransaction setCompletionBlock:^{
            self.miCuadradito.backgroundColor = [UIColor purpleColor];
        }];
        
        CATransform3D miTransform = self.miCuadradito.layer.transform;
        miTransform = CATransform3DMakeScale(2, 2, 1);
        self.miCuadradito.layer.transform = miTransform;
        
    }];
    
    self.miCuadradito.layer.position = self.view.layer.position;
    self.miCuadradito.layer.cornerRadius = 33;
    [CATransaction commit];
    
    
    /*
    [CATransaction begin];
    
    [CATransaction setAnimationDuration:2];
    self.miCuadradito.backgroundColor = [UIColor purpleColor];
    [CATransaction commit];*/
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
