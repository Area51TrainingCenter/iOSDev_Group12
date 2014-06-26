//
//  ViewController.h
//  FiltrosApp
//
//  Created by iOS on 9/09/13.
//  Copyright (c) 2013 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    CIContext *miContexto;
    
    BOOL previewHecho;
}

@property (weak, nonatomic) IBOutlet UIImageView *miImagenView;
@property (strong,nonatomic) UIImagePickerController *miPicker;
@property (weak, nonatomic) IBOutlet UIButton *sepiaButton;
@property (weak, nonatomic) IBOutlet UIButton *poliButton;
@property (weak, nonatomic) IBOutlet UIButton *reverseButton;

@end
