//
//  HomeAssembly.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Swinject
import SwinjectStoryboard

struct HomeAssembly: Assembly {
  
  func assemble(container: Container) {
    
    container.register(UserNavigationController.self) {  _ in
      let sb = SwinjectStoryboard.create(name: R.storyboard.home.name,
                                         bundle: nil,
                                         container: container)
      let vc = sb.instantiateViewController(withIdentifier: R.storyboard.home.userNavigationController.identifier)
      return vc as! UserNavigationController
    }
    
    container.register(UserViewController.self) {  _ in
      let sb = SwinjectStoryboard.create(name: R.storyboard.home.name,
                                         bundle: nil,
                                         container: container)
      let vc = sb.instantiateViewController(withIdentifier: R.storyboard.home.userViewController.identifier)
      return vc as! UserViewController
    }
    
    container.register(UserViewModelType.self) { r in
      UserViewModel()
    }
    
  }
  
}
