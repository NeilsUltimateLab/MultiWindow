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

    var additionalWindows: [UIWindow] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = ViewController.navController()
        let frame = UIScreen.main.bounds
        
        window = UIWindow(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height/2))
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let newRootViewController = SecondWindowViewController.navController()
            newRootViewController.view.backgroundColor = .yellow
            
            let newWindow = UIWindow(frame: CGRect(x: frame.origin.x, y: (frame.height/2)+2, width: frame.width, height: (frame.height/2) - 2))
            newWindow.rootViewController = newRootViewController
            newWindow.isHidden = false
            self.additionalWindows.append(newWindow)
            newWindow.alpha = 0
            newWindow.frame.size = .zero
            newWindow.frame.origin = CGPoint(x: frame.midX, y: frame.midY)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                newWindow.alpha = 1
                newWindow.frame.origin = CGPoint(x: frame.origin.x, y: frame.midY)
                newWindow.frame.size = CGSize(width: frame.width, height: (frame.height/2) - 2)
            }, completion: nil)
            
            // To close the new window uncomment below code.
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                self.close(window: newWindow)
            }
        }
        
        
        return true
    }
    
    func close(window: UIWindow, animated: Bool = true) {
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let index = appDelegate.additionalWindows.firstIndex(of: window)
        else { return }
        
        func remove() {
            window.isHidden = true
            appDelegate.additionalWindows.remove(at: index)
        }
        
        if animated {
            let timingParameters = UISpringTimingParameters(dampingRatio: 0.9)
            let animator = UIViewPropertyAnimator(duration: 0.7, timingParameters: timingParameters)
            
            animator.addAnimations {
                window.alpha = 0
                window.frame = CGRect(x: window.frame.midX, y: window.frame.midY, width: 0, height: 0)
            }
            
            animator.addCompletion { _ in
                remove()
            }
            
            animator.startAnimation()
        } else {
            remove()
        }
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

