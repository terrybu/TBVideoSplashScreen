# TBVideoSplashScreen

In your AppDelegate.swift, go to didFinishLaunchingWithOptions

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        TBVideoSplashScreen.makeAndPlayVideoSplashScreen(self, videoNameString: "splashScreen", withExtension: "mp4", launchImageString: "launchScreenImage")
        return true
    }
    
Make sure you implement moviePlayBackDidFinish() as callback method in the same file

    @objc
    func moviePlayBackDidFinish() {
        //any custom logic for callback goes here
        let vc: UIViewController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! UIViewController
        let navCtrl = UINavigationController(rootViewController: vc)
        window?.rootViewController! = navCtrl
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
