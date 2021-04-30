//
//  ManagersAssembly.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Swinject
import SwinjectStoryboard

struct ServicesAssembly: Assembly {
  
  func assemble(container: Container) {
    
    container.register(DatabaseManagerType.self) { _ in
      DatabaseManager()
    }
    
    container.register(HomeWebServiceType.self) { _ in
      HomeWebService()
    }
  }
  
}
