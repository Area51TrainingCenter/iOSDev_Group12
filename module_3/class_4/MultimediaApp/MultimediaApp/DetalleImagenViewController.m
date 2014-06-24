//
//  DetalleImagenViewController.m
//  MultimediaApp
//
//  Created by iOS on 6/23/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "DetalleImagenViewController.h"

@interface DetalleImagenViewController ()

@end

@implementation DetalleImagenViewController

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
    
    self.imagenView.image = self.miImagen;
    miContexto =[CIContext contextWithOptions:nil];
}

- (IBAction)apretoSepia:(UIBarButtonItem *)sender {
    
    //Crear un hilo
    //1. Selectors
    
    
    //Mostrar un loading
    [self performSelectorInBackground:@selector(aplicarSepia) withObject:nil];
    
    //2. Bloques
    
    NSBlockOperation *miBloque = [NSBlockOperation blockOperationWithBlock:^{
        
        [self aplicarSepia];
        
    }];
    
    [miBloque start];
    
    //3. Grand Central Dispatch (GCD)
    
    dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
    dispatch_async(myQueue, ^{
        // Perform long running process
        
        
        
    });
    
}


-(void)aplicarSepia
{
    CGImageRef miRef = self.imagenView.image.CGImage;
    CIImage *ciImagenInicial = [CIImage imageWithCGImage:miRef];
    
    CIFilter *filtroSepia = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:@"inputIntensity",@1.0,@"inputImage",ciImagenInicial, nil];
    
    CIImage *ciImagenFinal =[filtroSepia outputImage];
    
    CGImageRef nuevoRef =[miContexto createCGImage:ciImagenFinal fromRect:ciImagenFinal.extent];
    
    UIImage *imagenResultado = [UIImage imageWithCGImage:nuevoRef];
    
    self.imagenView.image = imagenResultado;
    
    CGImageRelease(nuevoRef);
    
    //Quitar el loading
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
