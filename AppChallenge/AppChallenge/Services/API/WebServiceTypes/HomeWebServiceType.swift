//
//  HomeWebServiceType.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

protocol HomeWebServiceType {
  
  func users(success: RequestSuccessClosure<[UserResponse]>?,
             failure: RequestFailureClosure?)
  
}

struct HomeWebService: HomeWebServiceType {
  
  private let service: WebService<HomeAPI>
  
  init(service: WebService<HomeAPI> = .init()) {
    self.service = service
  }
  
  func users(success: RequestSuccessClosure<[UserResponse]>?,
             failure: RequestFailureClosure?) {
    service.requestObject(path: .users,
                          success: success,
                          failure: failure)
  }
  
}
