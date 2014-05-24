//
//  ViewController.h
//  MiMultitouchApp
//
//  Created by iOS on 23/05/14.
//  Copyright (c) 2014 C27-II. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *coloresOriginales;
}

@property (weak, nonatomic) IBOutlet UIView *segundoView;
@property (weak, nonatomic) IBOutlet UIView *primerView;


- (IBAction)seHizoDobleTap:(UITapGestureRecognizer *)sender;
- (IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender;

@end
