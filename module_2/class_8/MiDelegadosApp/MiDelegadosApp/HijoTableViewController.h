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

@end


@interface HijoTableViewController : UITableViewController

@property (strong,nonatomic) id<PapaDelegado> miDelegado;

@end
