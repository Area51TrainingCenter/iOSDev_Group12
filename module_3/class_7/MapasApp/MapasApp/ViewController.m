//
//  ViewController.m
//  MapasApp
//
//  Created by iOS on 6/25/14.
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
    MKPointAnnotation *punto1 = [[MKPointAnnotation alloc] init];
    punto1.coordinate = CLLocationCoordinate2DMake(-12.117072, -77.032559);
    punto1.title = @"Hostal Vanidades";
    
    [self.miMapa addAnnotation:punto1];
}


- (IBAction)anhadirPin:(UIBarButtonItem *)sender {
    
    MKPointAnnotation *punto1 = [[MKPointAnnotation alloc] init];
    punto1.coordinate = self.miMapa.centerCoordinate;
    punto1.title = @"Nuevo Pin";
    
    [self.miMapa addAnnotation:punto1];
    
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *miPin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"punto1"];
    
    if (!miPin) {
        miPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"punto1"];
  
    }
    
    miPin.pinColor = MKPinAnnotationColorGreen;
    miPin.draggable = YES;
    miPin.canShowCallout=YES;
    miPin.animatesDrop = YES;
    
    return miPin;
}



-(void)viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D centroPeru = CLLocationCoordinate2DMake(-12.035291, -77.044373);
    
    [self setearCentro:centroPeru conDistancia:20000];
}

- (IBAction)apretoMyLocation:(UIBarButtonItem *)sender {
    self.miMapa.showsUserLocation = YES;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
   CLLocationCoordinate2D miUbicacion =  userLocation.coordinate;
    
    [self setearCentro:miUbicacion conDistancia:400];
}


-(void)setearCentro:(CLLocationCoordinate2D)nuevoCentro conDistancia:(float)nuevaDistancia
{
    MKCoordinateRegion miRegion = MKCoordinateRegionMakeWithDistance(nuevoCentro, nuevaDistancia, nuevaDistancia);
    
    [self.miMapa setRegion:miRegion animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
