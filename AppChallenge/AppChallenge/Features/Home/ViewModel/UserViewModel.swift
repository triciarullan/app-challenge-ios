//
//  UserViewModel.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import UIKit

protocol UserViewModelDelegate {
  
  func userViewModelNeedsReloadData(_ vieWModel: UserViewModelType)

}

protocol UserViewModelType {
  
  var delegate: UserViewModelDelegate? { get set }
  var sectionModels: [UserSectionModel] { get }
  var title: String { get }
  
  func didSelect(at indexPath: IndexPath)
  func itemModel(at indexPath: IndexPath) -> UserSectionItemModel
  func logout()
  
}

class UserViewModel: UserViewModelType {
  
  init(webService: HomeWebServiceType = resolve(HomeWebServiceType.self)) {
    self.webService = webService
    
    getUserAPI()
  }
  
  func itemModel(at indexPath: IndexPath) -> UserSectionItemModel {
      return sectionModels[indexPath.section].items[indexPath.row]
  }
  
  func didSelect(at indexPath: IndexPath) {
    
  }
  
  func logout() {
    appInfoHelper.appUserDefaults.setIsLoggedIn(false)
    appDelegate.showLogin()
  }
  
  var title: String {
    return R.string.localizable.users().uppercased()
  }
  var delegate: UserViewModelDelegate?
  var sectionModels = [UserSectionModel]() {
    didSet {
      delegate?.userViewModelNeedsReloadData(self)
    }
  }
  
  private var webService: HomeWebServiceType
  private var users: [UserResponse]?
  private let appDelegate = UIApplication.shared.delegate as! AppDelegate
  private let appInfoHelper = AppInfoHelper.shared
  
}


private extension UserViewModel {
  
  func updateSectionModels() -> [UserSectionModel] {
    
    var sectionModels = [UserSectionModel]()
  
    guard let users = users else { return sectionModels }
    
    for user in users {
      let viewModel = UserTableCellViewModel(user: user)
      sectionModels.append(UserSectionModel(items: [.details(viewModel: viewModel)]))
    }
    return sectionModels
  }
  
  func getUserAPI() {
    webService.users(success: { response in
      self.users = response
      self.sectionModels = self.updateSectionModels()
    }, failure: { _ in
      
    })
  }
  
}
