//
//  MiTablaViewController.m
//  AnimacionTablaApp
//
//  Created by iOS on 6/4/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "MiTablaViewController.h"
#import "AnimacionCell.h"

@interface MiTablaViewController ()

@end

@implementation MiTablaViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"miPlantilla";
    AnimacionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UIPanGestureRecognizer *miPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(seEstaHaciendoPan:)];
    miPan.delegate = self;
    
    [cell.miVistaExterna addGestureRecognizer:miPan];
    
    //Core Animation Implicito
    //cell.miVistaExterna.layer.delegate = self;
    
    return cell;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}


-(IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender
{
    [self volverACerrar:sender.view];
    
    CGPoint traslacion = [sender translationInView:sender.view.superview];
    
    CATransform3D miTransform = sender.view.layer.transform;
    miTransform = CATransform3DMakeTranslation(traslacion.x, 0, 0);
    
    //Core Animation Implicito
    //[CATransaction setAnimationDuration:0];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        //Core Animation Implicito
        //[CATransaction setAnimationDuration:0.2];
        
        if (ABS(traslacion.x) < (self.view.frame.size.width/2) ) {
            
            miTransform = CATransform3DMakeTranslation(0, 0, 0);
            
        }
        else
        {
            miTransform = CATransform3DMakeTranslation((traslacion.x/ABS(traslacion.x))*self.view.frame.size.width, 0, 0);
            vistaActual = sender.view;
        }
        
        
    }
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        sender.view.layer.transform = miTransform;
    } completion:nil];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self volverACerrar:nil];
    
}

- (IBAction)seApretoOpcionCelda:(UIButton *)sender {
    
    [self volverACerrar:nil];
    
}

-(void)volverACerrar:(UIView *)vistaNueva
{
    if (vistaActual && ![vistaNueva isEqual:vistaActual]) {
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            vistaActual.layer.transform = CATransform3DMakeTranslation(0, 0, 0);
        } completion:nil];
        
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
