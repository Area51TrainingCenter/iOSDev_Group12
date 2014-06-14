//
//  PrincipalTableViewController.h
//  SolucionPractica2App
//
//  Created by iOS on 6/13/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PrincipalDelegado <NSObject>

-(void)PrincipalApretoBotonIzquierdo;
-(void)PrincipalApretoBotonDerecho;

@end

@interface PrincipalTableViewController : UITableViewController

@property (nonatomic,strong) id<PrincipalDelegado>miDelegado;

@end
