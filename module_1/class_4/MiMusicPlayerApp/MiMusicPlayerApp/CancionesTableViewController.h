//
//  CancionesTableViewController.h
//  MiMusicPlayerApp
//
//  Created by iOS on 5/9/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface CancionesTableViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UIImageView *miPosterView;
@property (weak, nonatomic) IBOutlet UILabel *miNombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *miAnhoLabel;


@property (strong,nonatomic) Album *miAlbum;
@end
