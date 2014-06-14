//
//  ViewController.m
//  DynamicsChiquitoApp
//
//  Created by iOS on 6/13/14.
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
    
    animator = [[UIDynamicAnimator alloc] init];
    
    UICollisionBehavior *colisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.miCuadradoAmarillo]];
    colisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:colisionBehavior];
}

-(void)viewDidAppear:(BOOL)animated
{
    UIGravityBehavior *gravedadBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.miCuadradoAmarillo]];
    
    [animator addBehavior:gravedadBehavior];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
