//
//  MultimediaTableViewController.h
//  MultimediaApp
//
//  Created by iOS on 6/16/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface MultimediaTableViewController : UITableViewController
{
    MPMoviePlayerController *miVideoPlayer;
    
    AVAudioPlayer *miaudioPlayer;
    AVQueuePlayer *miQueuePlayer;
    
}
@property (weak, nonatomic) IBOutlet UIView *miVideoContenedor;
@property (weak, nonatomic) IBOutlet UISlider *miVolumenSlider;

@end
