//
//  AppInfoHelper.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

class AppInfoHelper {
  
  var appUserDefaults: UserDefaults
  
  static var shared = AppInfoHelper.init()
  
  init() {
    appUserDefaults = UserDefaults.standard
  }
}

extension UserDefaults {
  
  enum UserDefaultsKeys: String {
    case isLoggedIn = "isLoggedIn"
  }
  
  var isLoggedIn: Bool? {
    guard self.value(forKey: UserDefaultsKeys.isLoggedIn.rawValue) != nil else { return nil }
    return self.bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
  }
  
  func setIsLoggedIn(_ isLoggedIn: Bool?) {
    self.set(isLoggedIn, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
  }
  
}
