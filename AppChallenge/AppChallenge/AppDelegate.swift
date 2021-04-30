//
//  AppDelegate.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/28/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    configureRootView()
    
    return true
  }
  
  func showLogin() {
    let viewController = Scene.login.viewController()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
  
  func showHome() {
    let viewController = Scene.user.viewController()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
  
}

private extension AppDelegate {
  
  func configureRootView() {
    if let isLoggedIn = AppInfoHelper.shared.appUserDefaults.isLoggedIn,
       isLoggedIn {
      showHome()
    } else {
      showLogin()
    }
  }
  
}
