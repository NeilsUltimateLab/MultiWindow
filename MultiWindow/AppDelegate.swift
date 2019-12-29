//
//  AppDelegate.swift
//  MultiWindow
//
//  Created by Neil Jain on 11/17/18.
//  Copyright © 2018 Neil Jain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var anotherWindow: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let vc = ViewController.navController()
        window = UIWindow()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        let vc2 = SecondWindowViewController.navController()
        vc2.view.backgroundColor = .yellow
        anotherWindow = UIWindow()
        anotherWindow?.rootViewController = vc2
        anotherWindow?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let frame = window?.frame {
            let new = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height/2)
            window?.frame = new
            window?.layer.cornerRadius = 15
            window?.layer.masksToBounds = true
            window?.superview?.backgroundColor = .yellow
            anotherWindow?.frame = CGRect(x: frame.origin.x, y: (frame.height/2)+2, width: frame.width, height: (frame.height/2) - 2)
            anotherWindow?.layer.cornerRadius = 15
            anotherWindow?.layer.masksToBounds = true
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
