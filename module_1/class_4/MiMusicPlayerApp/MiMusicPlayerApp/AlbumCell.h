//
//  AlbumCell.h
//  MiMusicPlayerApp
//
//  Created by iOS on 14/05/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *anhoLabel;
@property (weak, nonatomic) IBOutlet UILabel *numCancionesLabel;

@end
