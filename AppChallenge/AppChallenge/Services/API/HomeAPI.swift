//
//  LoginWebServiceType.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Moya

enum HomeAPI {
  case users
}

extension HomeAPI: TargetType {
  
  var baseURL: URL {
    URL(string: APIConstants.baseURL)!
  }
  
  var path: String {
    switch self {
    case .users:
      return "users"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .users:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .users:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
  
  private var parameters: [String: Any] {
    switch self {
    case .users:
      return ([:])
    }
  }
  
}
