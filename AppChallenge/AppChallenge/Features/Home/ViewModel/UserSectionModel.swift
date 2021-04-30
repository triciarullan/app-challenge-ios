//
//  UserSectionModel.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation
import UIKit

struct UserSectionModel {
  var items: [UserSectionItemModel]
}

// MARK: - UserSectionItemModel

enum UserSectionItemModel {
  case details(viewModel: UserTableCellViewModelType)
}

extension UserSectionItemModel {
  
  var reuseIdentifier: String {
    switch self {
    case .details:
      return R.nib.userTableViewCell.identifier
    }
  }
  
  func viewModel<T>() -> T {
    switch self {
    case let .details(viewModel):
      return viewModel as! T
    }
  }
  
}

protocol UserSectionItemModelBindableType {
  func bindItemModel(to itemModel: UserSectionItemModel)
}

extension UserSectionItemModelBindableType where Self: UITableViewCell & BindableType {
  
  func bindItemModel(to itemModel: UserSectionItemModel) {
    guard let viewModel: ViewModelType = itemModel.viewModel() else {
      fatalError("View model mismatched!")
    }
    var cell = self
    cell.bindViewModel(to: viewModel)
  }
  
}
