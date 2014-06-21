//
//  MisImagenesCollectionViewController.m
//  MultimediaApp
//
//  Created by iOS on 6/20/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "MisImagenesCollectionViewController.h"

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
}

-(int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"plantillaCelda" forIndexPath:indexPath];
    
    return celda;
}


- (IBAction)agregarImagen:(UIBarButtonItem *)sender {
    
    UIImagePickerController *miPicker = [[UIImagePickerController alloc] init];
    
    miPicker.delegate = self;
    miPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:miPicker animated:YES completion:nil];
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imagenSeleccionada =info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    actionSheet.destructiveButtonIndex
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
