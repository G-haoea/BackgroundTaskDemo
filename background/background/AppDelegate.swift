//
//  AppDelegate.swift
//  background
//
//  Created by Grace Liu on 26/07/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    //Claim a backgroundTask
    var backgroundTask : UIBackgroundTaskIdentifier! = nil

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    

    
    //What will happen after entering background
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        //Connect 'controller' with rootViewController
        let controller : ViewController = self.window?.rootViewController as! ViewController
        
        
        //If there exists a background task, make it invalid
        if self.backgroundTask != nil {
            application.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = UIBackgroundTaskIdentifier.invalid
        }
        
        
        //If rootViewController's flag is true, make it be valid
        if controller.flag == true{
            
            //Create background task
            self.backgroundTask = application.beginBackgroundTask(expirationHandler: {
                () -> Void in
                //If the endBackgroundTask has not been asked, it will be invalid after a fix time
                application.endBackgroundTask(self.backgroundTask)
                self.backgroundTask = UIBackgroundTaskIdentifier.invalid
            })
        }
        
        
        print("Enter background")
    }

    


}

