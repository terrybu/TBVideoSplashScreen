//
//  TBVideoSplashScreen.swift
//  Pods
//
//  Created by Terry Bu on 7/10/15.
//
//

import Foundation

import UIKit
import MediaPlayer


public class TBVideoSplashScreen {
    
    /**
    If you implement this method in AppDelegate, you must declare also in AppDelegate.Swift --> @objc func moviePlayBackDidFinish() as the callback method after video playback finish, or app will crash
    
    :param: appDelgate        Pass in the AppDelegate object. Basically pass self from AppDelegate.swift
    :param: videoNameString   whatever your video file's name is in string
    :param: withExtension     "mp4" or else
    :param: launchImageString This is just a good practice. If you extract out the first frame of your video and just make it a static image, it will serve as a placeholder until your video loads giving the illusion of shorter loading time
    */
    public class func makeAndPlayVideoSplashScreen(appDelegate: UIApplicationDelegate, videoNameString: String, withExtension: String, launchImageString:String?) {
        
        let movieURL = NSBundle.mainBundle().URLForResource(videoNameString, withExtension: withExtension)
        
        var myMoviePlayer = MPMoviePlayerViewController(contentURL: movieURL)
        
        NSNotificationCenter.defaultCenter().addObserver(appDelegate, selector: "moviePlayBackDidFinish", name: MPMoviePlayerPlaybackDidFinishNotification, object: myMoviePlayer.moviePlayer)
        
        myMoviePlayer.moviePlayer.controlStyle = MPMovieControlStyle.None
        if let launchImage = launchImageString {
            myMoviePlayer.moviePlayer.backgroundView.addSubview(UIImageView(image: UIImage(named: launchImage)))
        }
        myMoviePlayer.moviePlayer.scalingMode = MPMovieScalingMode.Fill
        appDelegate.window!!.rootViewController! = myMoviePlayer
        myMoviePlayer.moviePlayer.setFullscreen(true, animated: false)
        myMoviePlayer.moviePlayer.play()
    }
    
    /**
    
    This is an alternate to the original method with additional param, selector.
    In your selector method, remember to remove observer at end by NSNotificationCenter.defaultCenter().removeObserver(self)
    
    :param: appDelegate
    :param: videoNameString
    :param: withExtension
    :param: launchImageString
    :param: selector          This is for selector name. When MPMoviePlayer finishes, the default method will use "moviePlayBackDidFinish" as the name of the method that gets triggered upon notification. Specify this selector name with another string to handle your video playback completion in any other named method you wish
    */
    public class func makeAndPlayVideoSplashScreen(appDelegate: UIApplicationDelegate, videoNameString: String, withExtension: String, launchImageString:String?, selector: String) {
        
        let movieURL = NSBundle.mainBundle().URLForResource(videoNameString, withExtension: withExtension)
        
        var myMoviePlayer = MPMoviePlayerViewController(contentURL: movieURL)
        
        NSNotificationCenter.defaultCenter().addObserver(appDelegate, selector: Selector(selector), name: MPMoviePlayerPlaybackDidFinishNotification, object: myMoviePlayer.moviePlayer)
        
        myMoviePlayer.moviePlayer.controlStyle = MPMovieControlStyle.None
        if let launchImage = launchImageString {
            myMoviePlayer.moviePlayer.backgroundView.addSubview(UIImageView(image: UIImage(named: launchImage)))
        }
        myMoviePlayer.moviePlayer.scalingMode = MPMovieScalingMode.Fill
        appDelegate.window!!.rootViewController! = myMoviePlayer
        myMoviePlayer.moviePlayer.setFullscreen(true, animated: false)
        myMoviePlayer.moviePlayer.play()
    }
    
    
    
    
}