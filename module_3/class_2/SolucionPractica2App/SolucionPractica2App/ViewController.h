//
//  ViewController.h
//  SolucionPractica2App
//
//  Created by iOS on 6/11/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrincipalTableViewController.h"

@interface ViewController : UIViewController <PrincipalDelegado>
{
    int ultimaTraslacion;
}
@property (weak, nonatomic) IBOutlet UIView *menuDerechaView;
@property (weak, nonatomic) IBOutlet UIView *menuIZquierdaView;
@property (weak, nonatomic) IBOutlet UIView *principalContainerView;
@end
