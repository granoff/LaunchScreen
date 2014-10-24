# LaunchScreen

[![CI Status](http://img.shields.io/travis/granoff/LaunchScreen.svg?style=flat)](https://travis-ci.org/granoff/LaunchScreen)
[![Version](https://img.shields.io/cocoapods/v/LaunchScreen.svg?style=flat)](http://cocoadocs.org/docsets/LaunchScreen)
[![License](https://img.shields.io/cocoapods/l/LaunchScreen.svg?style=flat)](http://cocoadocs.org/docsets/LaunchScreen)
[![Platform](https://img.shields.io/cocoapods/p/LaunchScreen.svg?style=flat)](http://cocoadocs.org/docsets/LaunchScreen)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

See below for how to integrate `LaunchScreen` into your app.

## Requirements

This class, and the associated example, take advantage of Xcode 6's ability to use a Launch Screen storyboard rather than a set of
Default images. It relies on a new Info.plist key `UILaunchStoryboardName`.

## Motivation

Although Apple recommends against so called "splash" screens that show anything other than an app's initial, content-free chrome, it is common practice for apps to
show a splash screen with some kind of graphic, perhaps animated, and often with some kind of indication that something is happening (e.g. an activity indicator spinning away).

Traditionally, to provide any kind of overlaid, long showing launch screen, you had to instantiate a view, fill it with something, display it over your initial view, then remove it. The mechanics of this
are not complicated, but the hitch is when the "something" you want to fill this view with is not just a solid color. Here's where you start having many different versions and sizes of "Default.png"
(with the lengthy list of names for different devices and screen sizes). With the introduction of the iPhone 6 and 6+, this nightmare expanded.

Enter Launch Screen XIBs made available with Xcode 6. These XIBs let you layout an initial screen that the system will display while it loads your app. You can use just about any UIKit element, including an activity indicator if you wanted to 
(but you'd have no way to control it programatically), and you can arrange everything using Auto Layout. So the need for multiple "Default" images is basically eliminated.

Why can't we use that XIB file programatically? It's just a UIView with other UIKit elements inside it. And, there's no reason we can't load it up and even
add UIKit elements to the view dynamically. The trick, however, is that we're not going to affect what the system displays straight from the XIB. Instead, we're going to instantiate the XIB, insert its view into
the view of another UIViewController from our storyboard, and manipulate that.

The trick that allows this to work for all screen sizes (and we're assuming you are using Size Classes in your storyboard) is that you must include in your storyboard a UIViewController whose class is LaunchScreenViewController. You must give this scene a storyboard identifier. There are two init methods; one assumes
a storyboard id of `LaunchScreenViewController`, the other takes the id as a parameter if you'd prefer to use another id. By having a scene in your storyboard, and by using size classes, you are gauranteed that your Launch Screen XIB's view will be sized up or down as needed to fill the screen.

## Installation

LaunchScreen is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "LaunchScreen"

## Integration

Once you have LaunchScreen installed, using it is really simple...

## Author

Mark H. Granoff, mark@granoff.net

## License

LaunchScreen is available under the MIT license. See the LICENSE file for more info.

