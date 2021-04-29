//
//  Person.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

struct Person {
  
  var username: String = ""
  var password: String = ""
  var id: Int = 0
  
  init(id: Int, username: String, password: String) {
    self.id = id
    self.username = username
    self.password = password
  }
  
}
