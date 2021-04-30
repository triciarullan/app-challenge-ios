//
//  WebService.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

import Moya

typealias RequestSuccessClosure<T> = (_ result: T?) -> ()
typealias RequestFailureClosure = (_ error: WebServiceError?) -> ()

protocol WebServiceType {
  
  associatedtype Provider
  func requestObject<T: Decodable>(path: Provider, success: RequestSuccessClosure<T>?, failure: RequestFailureClosure?)
}

struct WebService<U: TargetType>: WebServiceType {
  
  private let provider: MoyaProvider<U>
  
  init(provider: MoyaProvider<U> = MoyaProvider<U>()) {
    self.provider = provider
  }
  
  func requestObject<T: Decodable>(path: U, success: RequestSuccessClosure<T>?, failure: RequestFailureClosure?) {
    self.provider.request(path) { result in
      
      switch result {
      case let .success(response):
        do {
          let jsonResponse = try? JSONSerialization.jsonObject(with: response.data, options: [])
          let object = try JSONDecoder().decode(T.self, from: response.data)
          success?(object)
        } catch {
          do {
            let object = try JSONDecoder().decode(APIErrorResponse.self, from: response.data)
            failure?(WebServiceError.api(object))
          } catch {
            failure?(WebServiceError.mapping)
          }
        }
      case let .failure(error):
        failure?(WebServiceError.moya(error))
      }
    }
  }
}
