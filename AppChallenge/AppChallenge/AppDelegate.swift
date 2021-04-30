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
    DispatchQueue.main.async {
      let viewController = Scene.login.viewController()
      self.window?.rootViewController = viewController
      self.window?.makeKeyAndVisible()
    }
  }
  
  func showHome() {
    DispatchQueue.main.async {
      let viewController = Scene.user.viewController()
      self.window?.rootViewController = viewController
      self.window?.makeKeyAndVisible()
    }
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
