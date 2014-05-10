//
//  AlbumesViewController.h
//  MiMusicPlayerApp
//
//  Created by iOS on 5/7/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import "Cancion.h"

@interface AlbumesViewController : UITableViewController
{
    Album *album1;
}

@property (weak, nonatomic) IBOutlet UITextField *albumTextField;

@property (weak, nonatomic) IBOutlet UILabel *tituloAlbumLabel;
@property (weak, nonatomic) IBOutlet UILabel *numCancionesAlbumLabel;
@property (weak, nonatomic) IBOutlet UILabel *anhoAlbumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterAlbumView;


@end
