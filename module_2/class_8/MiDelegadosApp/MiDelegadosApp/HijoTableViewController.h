//
//  HijoTableViewController.h
//  MiDelegadosApp
//
//  Created by iOS on 6/6/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PapaDelegado <NSObject>

-(void)mostrarAlerta;
-(void)escribioTexto:(NSString *)nuevoTexto;

@end


@interface HijoTableViewController : UITableViewController

@property (strong,nonatomic) id<PapaDelegado> miDelegado;
@property (weak, nonatomic) IBOutlet UITextField *miTextfield;
@property (strong,nonatomic) NSString *nuevoTexto;


@end
