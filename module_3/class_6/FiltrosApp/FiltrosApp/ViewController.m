//
//  ViewController.m
//  FiltrosApp
//
//  Created by iOS on 9/09/13.
//  Copyright (c) 2013 Area51. All rights reserved.
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
    miContexto = [CIContext contextWithOptions:nil];
    
    //
    self.miPicker = [[UIImagePickerController alloc] init];
    self.miPicker.delegate = self;
    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    if (!previewHecho) {
        NSBlockOperation *miBloque =[NSBlockOperation blockOperationWithBlock:^{
            [self generarPreviews];
        }];
        
        [miBloque start];
        
        previewHecho=YES;
    }
    
    
    
}


-(void)generarPreviews
{
    UIImage *imagenPreview = [self escalarImagen:self.miImagenView.image aEscala:0.1];
    
    UIImage *previewSepia = [self aplicarFiltro:@"CISepiaTone" aImagen:imagenPreview conOpciones:@[@"inputIntensity",[NSNumber numberWithFloat:1]]];
    [self.sepiaButton setImage:previewSepia forState:UIControlStateNormal];
    
    UIImage *previewPosterize = [self aplicarFiltro:@"CIColorPosterize" aImagen:imagenPreview conOpciones:@[@"inputLevels",[NSNumber numberWithFloat:6]]];
    [self.poliButton setImage:previewPosterize forState:UIControlStateNormal];
    
    UIImage *previewGaussian = [self aplicarFiltro:@"CIGaussianBlur" aImagen:imagenPreview conOpciones:@[@"inputRadius",[NSNumber numberWithFloat:10]]];
    [self.reverseButton setImage:previewGaussian forState:UIControlStateNormal];
}


- (IBAction)sepiaPressed:(UIButton *)sender
{
    
    NSBlockOperation *miBloque =[NSBlockOperation blockOperationWithBlock:^{
        
        self.miImagenView.image = [self aplicarFiltro:@"CISepiaTone" aImagen:self.miImagenView.image conOpciones:@[@"inputIntensity",[NSNumber numberWithFloat:1]]];
    }];
    
    [miBloque start];
    
    
 
}

- (IBAction)poliPressed:(UIButton *)sender
{
    NSBlockOperation *miBloque =[NSBlockOperation blockOperationWithBlock:^{
        
        self.miImagenView.image = [self aplicarFiltro:@"CIColorPosterize" aImagen:self.miImagenView.image conOpciones:@[@"inputLevels",[NSNumber numberWithFloat:6]]];
    }];
    
    [miBloque start];
    
    
}

- (IBAction)resetPressed:(UIButton *)sender
{
    NSBlockOperation *miBloque =[NSBlockOperation blockOperationWithBlock:^{
        
        self.miImagenView.image = [self aplicarFiltro:@"CIGaussianBlur" aImagen:self.miImagenView.image conOpciones:@[@"inputRadius",[NSNumber numberWithFloat:10]]];
    }];
    
    [miBloque start];
    
    
}

-(UIImage *)aplicarFiltro:(NSString *)nombreFiltro aImagen:(UIImage *)imagenInicial conOpciones:(NSArray *)opciones
{
    CIImage *ciImagenInicial = [CIImage imageWithCGImage:imagenInicial.CGImage];
    
    
    CIFilter *sepiaFiltro = [CIFilter filterWithName:nombreFiltro keysAndValues:kCIInputImageKey,ciImagenInicial,opciones[0],opciones[1], nil];
    
    CIImage *ciImagenFinal = [sepiaFiltro outputImage];
    
    CGImageRef refImagenFinal = [miContexto createCGImage:ciImagenFinal fromRect:[ciImagenInicial extent]];
    
    UIImage *imagenFinalMera = [UIImage imageWithCGImage:refImagenFinal];
    
    CGImageRelease(refImagenFinal);
    
    
    return imagenFinalMera;
    
    
    
    
}

- (IBAction)fromLibraryPressed:(UIBarButtonItem *)sender
{
    
    self.miPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    
    [self presentViewController:self.miPicker animated:YES completion:nil];
    
}

- (IBAction)fromCameraPressed:(UIBarButtonItem *)sender
{
    self.miPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    [self presentViewController:self.miPicker animated:YES completion:nil];
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    self.miImagenView.image = (UIImage *)info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}



-(UIImage *)escalarImagen:(UIImage *)imagenOriginal aEscala:(float)escala
{
    CGSize nuevoSize = CGSizeMake(imagenOriginal.size.width*escala, imagenOriginal.size.height*escala);
    
    
    UIGraphicsBeginImageContext(nuevoSize);
    [imagenOriginal drawInRect:CGRectMake(0, 0, nuevoSize.width, nuevoSize.height)];
    
    UIImage *imagenFinal = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imagenFinal;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
