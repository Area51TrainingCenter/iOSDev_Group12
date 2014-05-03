//
//  ChanchaTableViewController.m
//  MiSegundaApp
//
//  Created by iOS on 5/2/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "ChanchaTableViewController.h"

@interface ChanchaTableViewController ()

@end

@implementation ChanchaTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.miSlider.value = 1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 1) {
        
        self.tableView.backgroundColor = [UIColor blueColor];
        
    }
}


- (IBAction)sliderCambio:(UISlider *)sender {
    
    self.numPersonasLabel.text = [NSString stringWithFormat:@"%0.0f",sender.value];
    [self calcularChancha:nil];
}


- (IBAction)calcularChancha:(UITextField *)sender {
    
    /*
    //Metodo 1, sin decimales
    int resultado = (self.montoTextField.text.intValue+self.propinaTextField.text.intValue)/self.numPersonasLabel.text.intValue;
    
    NSNumber *resultadoNumero = @(resultado);
    self.resultadoLabel.text = resultadoNumero.stringValue;
    */
    
    //Metodo 2, con decimales
    float resultado = (self.montoTextField.text.floatValue+self.propinaTextField.text.floatValue)/self.numPersonasLabel.text.floatValue;
    
    self.resultadoLabel.text = [NSString stringWithFormat:@"S/. %0.2f",resultado];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
