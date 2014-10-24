//
//  LaunchScreenViewController.h
//  OuttaMyWay
//
//  Created by Mark Granoff on 10/13/14.
//  Copyright (c) 2014 Hawk iMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LaunchScreenDelegate;

@interface LaunchScreenViewController : UIViewController

@property (nonatomic, assign) id<LaunchScreenDelegate> launchScreenDelegate;

/**
 *  Instantiate a LaunchScreenViewController from a storyboard containing a view controller
 *  with the identifier LaunchScreenViewController. 
 *
 *  @param storyboard A UIStoryboard object
 *
 *  @return LaunchScreenViewController whose view contains the UIView from your Launch Screen XIB
 */
-(instancetype)initFromStoryboard:(UIStoryboard *)storyboard;

/**
 *  Instantiate a LaunchScreenViewController from a storyboard containing a view controller
 *  with the identifier specified.
 *
 *  @param storyboard A UIStoryboard object
 *  @param identifier The storyboard identifier for your LaunchScreenViewController view controller
 *
 *  @return LaunchScreenViewController whose view contains the UIView from your Launch Screen XIB
 */
-(instancetype)initFromStoryboard:(UIStoryboard *)storyboard withIdentifier:(NSString *)identifier;

/**
 *  Returns a snapshot image of the rendeered view hierarchy of the LaunchScreenViewController.
 *  Minimally, this will be an image of your LaunchScreen XIB view, which is useful if you intend for
 *  your launchscreen to be static without further adornment (with say, an activity indicator). You
 *  might use this image in a UIImageView presented over your entire first view as a splash screen.
 *
 *  @return UIImage containing a snapshot of the rendered view hierarchy.
 */
-(UIImage *)snapshot;

@end

@protocol LaunchScreenDelegate <NSObject>

@optional
/**
 *  Objects implementing this method will be notified when the LaunchScreenViewController did appeaer.
 *  This is handy when you're using a LaunchScreenViewController (as opposed to just its view) as an
 *  initial view, to be replaced later. For example, you might provide a LaunchScreenViewController as
 *  the initial view for a UIPageViewController, and then replace it later with your real first view
 *  controller.
 *
 *  @param launchScreenViewController The LaunchScreenViewController whose view did appear
 */
-(void)launchScreenViewControllerDidAppear:(LaunchScreenViewController *)launchScreenViewController;

@end