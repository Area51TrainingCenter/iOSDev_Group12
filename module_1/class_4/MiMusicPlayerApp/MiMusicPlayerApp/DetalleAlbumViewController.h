//
//  DetalleAlbumViewController.h
//  MiMusicPlayerApp
//
//  Created by iOS on 5/7/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleAlbumViewController : UITableViewController

@property (nonatomic,strong) NSString *dato;
@property (weak, nonatomic) IBOutlet UILabel *resultadoLabel;


@end
