//
//  DetallePaisTableViewController.m
//  mundialApp
//
//  Created by iOS on 16/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
//

#import "DetallePaisTableViewController.h"
#import "JugadorCell.h"

@interface DetallePaisTableViewController ()

@end

@implementation DetallePaisTableViewController

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
    self.title = self.miPais.nombre;
    
    self.banderaView.image = self.miPais.bandera;
    self.poblacionLabel.text = self.miPais.poblacion;
    self.idiomaLabel.text = self.miPais.idioma;
    self.areaLabel.text = self.miPais.area;
    
    existeDT = self.miPais.dt!=nil;
    existenTitulares = self.miPais.titulares.count>0;
    existenSuplentes = self.miPais.suplentes.count>0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return (existeDT) + (existenTitulares) + (existenSuplentes);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            
            if (existenTitulares) {
                return self.miPais.titulares.count;
            }
            else if (existenSuplentes)
            {
                return self.miPais.suplentes.count;
            }
            else
            {
                return 1;
            }
            
            break;
        case 1:
            
            if (existenSuplentes)
            {
                return self.miPais.suplentes.count;
            }
            else
            {
                return 1;
            }
            
            break;
        case 2:
            
            return 1;
            
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"plantillaJugador";
    JugadorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Jugador *soyJugador;
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            
            if (existenTitulares) {
                
                soyJugador = self.miPais.titulares[indexPath.row];
                
               
            }
            else if (existenSuplentes)
            {
                soyJugador = self.miPais.suplentes[indexPath.row];
                
            }
            else
            {
                soyJugador = self.miPais.dt;
                
            }
            
            break;
        case 1:
            
            if (existenSuplentes)
            {
                soyJugador = self.miPais.suplentes[indexPath.row];
                
            }
            else
            {
                soyJugador = self.miPais.dt;
                
            }
            
            break;
        case 2:
            
            soyJugador = self.miPais.dt;
            
            break;
    }
    
    cell.fotoView.image = soyJugador.foto;
    cell.nombreLabel.text = soyJugador.nombre;
    
    return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            
            if (existenTitulares) {
                return @"Titulares";
            }
            else if (existenSuplentes)
            {
                return @"Suplentes";
            }
            else
            {
                return @"Director Técnico";
            }
            
            break;
        case 1:
            
            if (existenSuplentes)
            {
                return @"Suplentes";
            }
            else
            {
                return @"Director Técnico";
            }
            
            break;
        case 2:
            
            return @"Director Técnico";
            
            break;
            
        default:
            return @"";
            break;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
