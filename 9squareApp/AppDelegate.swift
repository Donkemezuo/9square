//
//  AppDelegate.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var launchScreenVC = LaunchViewController()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        launchScreen()
        return true
    }

    
    private func launchScreen() {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = launchScreenVC
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dismissLaunchScreen), userInfo: nil, repeats: false)
    }
    @objc func dismissLaunchScreen() {
        let mainVC = MainViewController()
        let favoriteVC = FavoriteViewController()
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorites"), tag: 1)
        let mainVCNav = UINavigationController.init(rootViewController: mainVC)
        let favVCNav = UINavigationController.init(rootViewController: favoriteVC)
        mainVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "searchIcon"), tag: 0)
        let tabBar = UITabBarController()
        tabBar.viewControllers = [mainVCNav,favVCNav]
        launchScreenVC.present(tabBar, animated: true, completion: nil)
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

