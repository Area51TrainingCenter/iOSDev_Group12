//
//  MultimediaTableViewController.m
//  MultimediaApp
//
//  Created by iOS on 6/16/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "MultimediaTableViewController.h"

@interface MultimediaTableViewController ()

@end

@implementation MultimediaTableViewController

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
    
    miVideoPlayer= [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mp4"]]];
    
    NSError *miError=nil;
    
    miaudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"audio1" ofType:@"mp3"]] error:&miError];
    
    ///////////////
    //Background Play
    
    AVPlayerItem *cancionItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"audio1" ofType:@"mp3"]]];
    
    miQueuePlayer = [AVQueuePlayer queuePlayerWithItems:@[cancionItem]];
    
    
    
    // Set AVAudioSession
    NSError *sessionError = nil;
    [[AVAudioSession sharedInstance] setDelegate:self];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    
    // Change the default output audio route
    UInt32 doChangeDefaultRoute = 1;
    AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker,
                            sizeof(doChangeDefaultRoute), &doChangeDefaultRoute);
    
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    
}

//Metodo necesario para que el evento de los controles del Lockscreen vengan acá y no al AppDelegate
-(BOOL)canBecomeFirstResponder
{
    return YES;
}


//Respondemos a los controles del Lockscreen
-(void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeRemoteControlPause)
    {
        [miQueuePlayer pause];
    }
    else if (event.subtype == UIEventSubtypeRemoteControlPlay)
    {
        [miQueuePlayer play];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    miVideoPlayer.view.frame = self.miVideoContenedor.bounds;
    [self.miVideoContenedor addSubview:miVideoPlayer.view];
    //[miVideoPlayer setFullscreen:YES animated:YES];
    
    self.miVolumenSlider.value = miaudioPlayer.volume;
}

- (IBAction)volumenCambio:(UISlider *)sender {
    
    [miaudioPlayer setVolume:sender.value];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row ==  1) {
        
        NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mp4"]];
        
                           MPMoviePlayerViewController *miViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
        
        miViewController.moviePlayer.allowsAirPlay = YES;
        //miViewController.moviePlayer.controlStyle = MPMovieControlStyleNone;
        
        [self presentMoviePlayerViewControllerAnimated:miViewController];
        
    }
    else if (indexPath.section == 1 && indexPath.row== 0)
    {
        /*UITableViewCell *miCelda = [tableView cellForRowAtIndexPath:indexPath];
        
        UILabel *elLabel;
        
        for (UIView *soyView in miCelda.contentView.subviews) {
            if ([soyView isKindOfClass:[UILabel class]]) {
                elLabel = (UILabel *)soyView;
                break;
            }
        }*/
        
        UILabel *miLabel = (UILabel *)[[tableView cellForRowAtIndexPath:indexPath] viewWithTag:101];
        
        
        
        if (miaudioPlayer.isPlaying) {
            [miaudioPlayer pause];
            miLabel.text = @"Audio Play";
        }
        else
        {
            [miaudioPlayer play];
            miLabel.text = @"Audio Pause";
        }
        
        
        
    }
    else if (indexPath.section == 1 && indexPath.row == 1)
    {
        [miQueuePlayer play];

    }
 
}
- (IBAction)tooglePlay:(UIButton *)sender {
    
    if (miVideoPlayer.playbackState == MPMoviePlaybackStatePlaying) {
        
        [miVideoPlayer pause];
        [sender setTitle:@"PLAY" forState:UIControlStateNormal];
        
    }
    else
    {
        [miVideoPlayer play];
        [sender setTitle:@"PAUSE" forState:UIControlStateNormal];
    }
}

@end
