//
//  HIViewController.m
//  LaunchScreen
//
//  Created by Mark Granoff on 10/23/2014.
//  Copyright (c) 2014 Mark Granoff. All rights reserved.
//

#import "ViewController.h"
#import "LaunchScreenViewController.h"

// With this set to 1, the view associated with the Launch Screen XIB will be used as a splash screen overlay,
// displayed for a couple seconds with added UI elements, then faded out to reveal a non-white view with a single
// button. Setting this macro to 0 causes the main view with the button to be shown immediately; the launch screen
// is only seen briefly (and without any other adornment) as the app is launched.
#define USE_LAUNCH_AS_SPLASH 1

@interface ViewController ()
@property (nonatomic, strong) LaunchScreenViewController *launchScreenVC;
@property (nonatomic, strong) UIImage *snapshot;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Instantiate a LaunchScreenViewController which will insert the UIView contained in our Launch Screen XIB
    // as a subview of it's view.
    self.launchScreenVC = [[LaunchScreenViewController alloc] initFromStoryboard:self.storyboard];
    
    // Take a snapshot of the launch screen. You could do this at any time you like.
    self.snapshot = [_launchScreenVC snapshot];


    // The following code, if enabled, will display the launch screen view and add a UILabel to it.
    // You could add almost anything, or do almost anything in any kind of view. But if you want your
    // splash screen to be based off your launch screen, this works!
#if USE_LAUNCH_AS_SPLASH == 1
    UIView *v = _launchScreenVC.view;
    [self.view addSubview:v];
    
    UILabel *l = [UILabel new];
    l.translatesAutoresizingMaskIntoConstraints = NO;
    l.text = @"Your dynamic message here.";
    l.font = [UIFont fontWithName:@"Georgia-Bold" size:17];
    l.textColor = [UIColor blueColor];
    [l sizeToFit];
    l.alpha = 0.0;
    
    [v addSubview:l];
    [v addConstraints:@[
                        [NSLayoutConstraint constraintWithItem:v
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:l
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:1],
                        [NSLayoutConstraint constraintWithItem:v
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:l
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:1]
                        ]];

    [UIView animateWithDuration:1.0
                          delay:0.5
                        options:0
                     animations:^{
                         l.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.0
                                               delay:2.0
                                             options:0
                                          animations:^{
                                              v.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [v removeFromSuperview];
                                          }];
                     }];
#endif
}

/**
 *  Show the launch screen snapshot when the button on the main view is tapped.
 *
 *  @param sender UIButton that was tapped
 */
-(IBAction)showLaunchScreen:(id)sender
{
    self.imageView = [[UIImageView alloc] initWithImage:_snapshot];
    _imageView.userInteractionEnabled = YES;
    _imageView.frame = self.view.bounds;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissImageView:)];
    [_imageView addGestureRecognizer:tap];
    
    [self.view addSubview:_imageView];
    
}

-(void)dismissImageView:(UITapGestureRecognizer *)tap
{
     [self.imageView removeFromSuperview];
     self.imageView = nil;
}

@end
