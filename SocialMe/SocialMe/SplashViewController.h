//
//  SplashViewController.h
//  SocialMe
//
//  Created by Jahn on 1/7/15.
//  Copyright (c) 2015 Chard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *preloaderImage;
@property (nonatomic, strong)  NSTimer *timerToMove;

@end
