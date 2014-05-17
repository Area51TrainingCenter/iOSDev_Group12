//
//  PaisesTableViewController.m
//  mundialApp
//
//  Created by iOS on 16/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
//

#import "PaisesTableViewController.h"
#import "Grupo.h"
#import "Pais.h"
#import "Jugador.h"
#import "PaisCell.h"

@interface PaisesTableViewController ()

@end

@implementation PaisesTableViewController

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
    NSString *rutaPlist = [[NSBundle mainBundle] pathForResource:@"Grupos" ofType:@"plist"];
    
    gruposPlist = [NSArray arrayWithContentsOfFile:rutaPlist];
    
    grupos = [NSMutableArray array];
    for (NSDictionary *soyGrupo in gruposPlist) {
        
        Grupo *nuevoGrupo = [[Grupo alloc] init];
        
        nuevoGrupo.nombre = soyGrupo[@"nombre"];
        
        nuevoGrupo.paises = [NSMutableArray array];
        for (NSDictionary *soyPais in soyGrupo[@"paises"]) {
            Pais *nuevoPais = [[Pais alloc] init];
            
            nuevoPais.bandera = [UIImage imageNamed:soyPais[@"bandera"]];
            nuevoPais.nombre = soyPais[@"nombre"];
            nuevoPais.poblacion = soyPais[@"poblacion"];
            nuevoPais.area = soyPais[@"area"];
            nuevoPais.idioma = soyPais[@"idioma"];
            
            NSDictionary *soyDT = soyPais[@"dt"];
            nuevoPais.dt = [[Jugador alloc] init];
            nuevoPais.dt.nombre = soyDT[@"nombre"];
            nuevoPais.dt.foto = [UIImage imageNamed:soyDT[@"foto"]];
            
            nuevoPais.titulares = [NSMutableArray array];
            for (NSDictionary *soyTitular in soyPais[@"titulares"]) {
                Jugador *nuevoTitular = [[Jugador alloc] init];
                
                nuevoTitular.nombre = soyTitular[@"nombre"];
                nuevoTitular.foto = [UIImage imageNamed:soyTitular[@"foto"]];
                
                [nuevoPais.titulares addObject:nuevoTitular];
            }
            
            nuevoPais.suplentes = [NSMutableArray array];
            for (NSDictionary *soySuplente in soyPais[@"titulares"]) {
                Jugador *nuevoSuplente = [[Jugador alloc] init];
                
                nuevoSuplente.nombre = soySuplente[@"nombre"];
                nuevoSuplente.foto = [UIImage imageNamed:soySuplente[@"foto"]];
                
                [nuevoPais.suplentes addObject:nuevoSuplente];
            }
            
            [nuevoGrupo.paises addObject:nuevoPais];
        }
        
        
        [grupos addObject:nuevoGrupo];
    }
    
    
    
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
    return grupos.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    Grupo *soyGrupo = grupos[section];
    
    return soyGrupo.paises.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"plantillaPais";
    PaisCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Pais *soyPais = ((Grupo *)grupos[indexPath.section]).paises[indexPath.row];
    
    cell.banderaView.image = soyPais.bandera;
    cell.nombreLabel.text = soyPais.nombre;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Grupo *soyGrupo= grupos[section];
    return  [NSString stringWithFormat:@"Grupo %@",soyGrupo.nombre];
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
