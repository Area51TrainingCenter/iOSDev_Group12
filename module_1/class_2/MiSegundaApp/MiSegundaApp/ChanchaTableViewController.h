//
//  ChanchaTableViewController.h
//  MiSegundaApp
//
//  Created by iOS on 5/2/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChanchaTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISlider *miSlider;
@property (weak, nonatomic) IBOutlet UITextField *montoTextField;
@property (weak, nonatomic) IBOutlet UITextField *propinaTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultadoLabel;
@property (weak, nonatomic) IBOutlet UILabel *numPersonasLabel;

@end
