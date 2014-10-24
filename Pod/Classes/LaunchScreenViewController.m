//
//  LaunchScreenViewController.m
//  OuttaMyWay
//
//  Created by Mark Granoff on 10/13/14.
//  Copyright (c) 2014 Hawk iMedia. All rights reserved.
//

#import "LaunchScreenViewController.h"

@implementation LaunchScreenViewController

-(instancetype)initFromStoryboard:(UIStoryboard *)storyboard
{
    return [self initFromStoryboard:storyboard withIdentifier:@"LaunchScreenViewController"];
}

-(instancetype)initFromStoryboard:(UIStoryboard *)storyboard withIdentifier:(NSString *)identifier;
{
    self = [storyboard instantiateViewControllerWithIdentifier:identifier];
    if (self) {
        NSString *launchScreenStoryboard = [[NSBundle mainBundle] infoDictionary][@"UILaunchStoryboardName"];
        if (launchScreenStoryboard) {
            UINib *nib = [UINib nibWithNibName:launchScreenStoryboard bundle:nil];
            NSArray *views = [nib instantiateWithOwner:nil options:nil];
            UIView *launchScreen = views[0];
            launchScreen.translatesAutoresizingMaskIntoConstraints = NO;
            
            [self.view addSubview:launchScreen];
            
            [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(0)-[launchScreen]-(0)-|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:NSDictionaryOfVariableBindings(launchScreen)]];
            
            [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[launchScreen]-(0)-|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:NSDictionaryOfVariableBindings(launchScreen)]];
        }
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (_launchScreenDelegate && [_launchScreenDelegate respondsToSelector:@selector(launchScreenViewControllerDidAppear:)])
        [_launchScreenDelegate launchScreenViewControllerDidAppear:self];
}

-(UIImage *)snapshot
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
