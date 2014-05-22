//
//  NotaCell.h
//  SolucionPractica1
//
//  Created by iOS on 21/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotaTextField.h"

@interface NotaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NotaTextField *miTextField;
@property (weak, nonatomic) IBOutlet UISwitch *miSwitch;

@end
