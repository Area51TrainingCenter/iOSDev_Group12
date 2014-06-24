//
//  MisImagenesCollectionViewController.m
//  MultimediaApp
//
//  Created by iOS on 6/20/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "MisImagenesCollectionViewController.h"
#import "ImagenCelda.h"
#import "DetalleImagenViewController.h"

@interface MisImagenesCollectionViewController ()



@end

@implementation MisImagenesCollectionViewController

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
    imagenes = [NSMutableArray array];
}

-(int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imagenes.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImagenCelda *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"plantillaCelda" forIndexPath:indexPath];
    
    UIImage *soyImagen = imagenes[indexPath.row];
    celda.imagenView.image = soyImagen;
    
    return celda;
}


- (IBAction)agregarImagen:(UIBarButtonItem *)sender {
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Desde Camara",@"Desde carrete", nil];
    
    [action showInView:self.view];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imagenSeleccionada =info[UIImagePickerControllerOriginalImage];

    [picker dismissViewControllerAnimated:YES completion:^{
        
        //1
        [imagenes insertObject:imagenSeleccionada atIndex:0];
        //2
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
        
    }];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [self obtenerPickerConSourceType:buttonIndex];
    }
}

-(void)obtenerPickerConSourceType:(int)source
{
    UIImagePickerController *miPicker = [[UIImagePickerController alloc] init];
    
    miPicker.delegate = self;
    miPicker.sourceType = !source?UIImagePickerControllerSourceTypeCamera:UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:miPicker animated:YES completion:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetalleImagenViewController *destino= segue.destinationViewController;
    
    NSIndexPath *indexPathSeleccionado =[self.collectionView indexPathsForSelectedItems][0];
    
    destino.miImagen = imagenes[indexPathSeleccionado.row];
    destino.title = [NSString stringWithFormat:@"Imagen Nº %d",indexPathSeleccionado.row+1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
