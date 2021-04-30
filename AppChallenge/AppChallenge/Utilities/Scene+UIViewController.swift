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
    case .user:
      return userViewController()
    case .userDetails:
      return userDetailsViewController()
    }
  }
}
  
private extension Scene {
  
  func loginViewController() -> UIViewController {
    let viewModel = resolve(LoginViewModelType.self)
    var controller = resolve(LoginViewController.self)
    controller.bindViewModel(to: viewModel)
    return controller
  }
  
  func userViewController() -> UIViewController {
    var controller = resolve(UserViewController.self)
    let viewModel = resolve(UserViewModelType.self)
    controller.bindViewModel(to: viewModel)
    let navigationController = resolve(UserNavigationController.self)
    navigationController.viewControllers = [controller]
    return navigationController
  }
  
  func userDetailsViewController() -> UIViewController {
    let controller = resolve(UserDetailsViewController.self)
    return controller
  }
  
}
