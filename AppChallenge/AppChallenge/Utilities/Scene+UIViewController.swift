//
//  Scene+UIViewController.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import UIKit

extension Scene {
  
  func viewController() -> UIViewController {
    switch self {
    case .login:
      return loginViewController()
    }
  }
}
  
private extension Scene {
  
  func loginViewController() -> UIViewController {
    //let viewModel = resolve(LoginViewModelType.self)
    var controller = resolve(LoginViewController.self)
   // controller.bindViewModel(to: viewModel)
    return controller
  }
  
}
