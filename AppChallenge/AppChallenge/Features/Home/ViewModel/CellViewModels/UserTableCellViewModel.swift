//
//  UserTableCellViewModel.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

protocol UserTableCellViewModelType {
  
  var name: String { get }
  var email: String { get }
  var id: String { get }
  var phone: String { get }
  
}

struct UserTableCellViewModel: UserTableCellViewModelType {
  
  init(user: UserResponse) {
    id = "\(user.id)"
    name = user.name
    email = user.email
    phone = user.phone
  }
  
  var id: String
  var name: String
  var email: String
  var phone: String
  
}
