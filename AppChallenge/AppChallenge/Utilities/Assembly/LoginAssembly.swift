//
//  LoginAssembly.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import Swinject
import SwinjectStoryboard

struct LoginAssembly: Assembly {
  
  func assemble(container: Container) {
    
    container.register(LoginViewController.self) {  _ in
      let sb = SwinjectStoryboard.create(name: R.storyboard.login.name,
                                         bundle: nil,
                                         container: container)
      let vc = sb.instantiateViewController(withIdentifier: R.storyboard.login.loginViewController.identifier)
      return vc as! LoginViewController
    }
    
    container.register(LoginViewModelType.self) { r in
      LoginViewModel(databaseManager: r.resolve(DatabaseManagerType.self)!)
    }
  }
  
}
