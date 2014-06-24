//
//  DetalleImagenViewController.h
//  MultimediaApp
//
//  Created by iOS on 6/23/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleImagenViewController : UIViewController
{
    CIContext *miContexto;
}
@property (weak, nonatomic) IBOutlet UIImageView *imagenView;
@property (strong,nonatomic) UIImage *miImagen;
@end
