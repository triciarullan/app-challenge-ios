//
//  APIErrorResponse.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

struct APIErrorResponse: Decodable {
  var code = 0
  var message: String?
}
