//
//  DetallePaisTableViewController.h
//  mundialApp
//
//  Created by iOS on 16/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pais.h"

@interface DetallePaisTableViewController : UITableViewController
{
    
    BOOL existeDT;
    BOOL existenTitulares;
    BOOL existenSuplentes;
    
}

@property (strong,nonatomic) Pais *miPais;
@property (weak, nonatomic) IBOutlet UIImageView *banderaView;
@property (weak, nonatomic) IBOutlet UILabel *poblacionLabel;
@property (weak, nonatomic) IBOutlet UILabel *idiomaLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;

@end
