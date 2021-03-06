# TBVideoSplashScreen

[![CI Status](http://img.shields.io/travis/Terry Bu/TBVideoSplashScreen.svg?style=flat)](https://travis-ci.org/Terry Bu/TBVideoSplashScreen)
[![Version](https://img.shields.io/cocoapods/v/TBVideoSplashScreen.svg?style=flat)](http://cocoapods.org/pods/TBVideoSplashScreen)
[![License](https://img.shields.io/cocoapods/l/TBVideoSplashScreen.svg?style=flat)](http://cocoapods.org/pods/TBVideoSplashScreen)
[![Platform](https://img.shields.io/cocoapods/p/TBVideoSplashScreen.svg?style=flat)](http://cocoapods.org/pods/TBVideoSplashScreen)

This library is for any iOS Developer who wants to display a video as the splash screen instead of a boring static launch image. 

In your AppDelegate.swift, import TBVideoSplashScreen and follow below code in didFinishLaunchingWithOptions.
The launch image you pass to makeAndPlayVideoSplashScreen is there for the best visual experience. Get the first frame of your video as a static image and set it as that image. While your video loads, that launch image will be the first thing shown to the user, giving the illusion that videoloading is slightly faster 

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        TBVideoSplashScreen.makeAndPlayVideoSplashScreen(self, videoNameString: "splashScreen", withExtension: "mp4", launchImageString: "launchScreenImage")
        
        return true
    }

Make sure you implement @objc moviePlayBackDidFinish() as callback method in the same file. This is the method that gets fired automatically upon video playback completion. Removing observer is just for safety

    @objc
    func moviePlayBackDidFinish() {
        //any custom logic for callback goes here
        let vc: UIViewController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! UIViewController
        let navCtrl = UINavigationController(rootViewController: vc)
        window?.rootViewController! = navCtrl
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

## Usage

To run the example project, clone repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TBVideoSplashScreen is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TBVideoSplashScreen"
```

## Author

Terry Bu

## License

TBVideoSplashScreen is available under the MIT license. See the LICENSE file for more info.
