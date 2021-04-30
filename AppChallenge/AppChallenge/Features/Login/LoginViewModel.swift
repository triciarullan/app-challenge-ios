//
//  LoginViewModel.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import UIKit

protocol LoginViewModelDelegate {
  func loginViewModel(_ viewModel: LoginViewModelType,
                      isSecureTextEntry: Bool,
                      updateRightButtonImage image: UIImage)
  func loginViewModel(_ viewModel: LoginViewModelType,
                      updateTextFieldLineColor usernameColor: UIColor,
                      passwordColor: UIColor)
  func loginViewModel(_ viewModel: LoginViewModelType,
                      showAlertControllerWithTitle title: String,
                      message: String)
  func loginViewModelShowLoadingView(_ viewModel: LoginViewModelType)
  func loginViewModelDismissLoadingView(_ viewModel: LoginViewModelType)
}

protocol LoginViewModelType {
  
  var username: String? { get set }
  var password: String? { get set }
  var delegate: LoginViewModelDelegate? { get set }
  
  func getUserNameTextFieldViewModel() -> TextViewModel
  func getPasswordTextFieldViewModel() -> TextViewModel
  func submitLogin()
}

class LoginViewModel: LoginViewModelType {

  init(databaseManager: DatabaseManagerType = DatabaseManager()) {
    self.databaseManager = databaseManager
    
    savePersons()
  }
  
  func getUserNameTextFieldViewModel() -> TextViewModel {
    let viewModel = TextViewModel(placeholderText: R.string.localizable.email(),
                                  leftIconImage: R.image.person()!)
    return viewModel
  }
  
  func getPasswordTextFieldViewModel() -> TextViewModel {
    let viewModel = TextViewModel(placeholderText: R.string.localizable.password(),
                                  leftIconImage: R.image.lock()!,
                                  rightIconImage: R.image.visibilityOn()!,
                                  rightButtonTappedClosure: passwordTappedClosure)
    return viewModel
  }
  
  func submitLogin() {
  
    delegate?.loginViewModelShowLoadingView(self)
    
    guard isValidEmail(username),
          let password = password, !password.isEmpty else {
      let usernameColor: UIColor = isValidEmail(username) ? R.color.osloGrey()! : R.color.warning()!
      let passwordColor: UIColor = self.password?.isEmpty ?? true ? R.color.warning()! : R.color.osloGrey()!
    
      var missingDetails = ""
      if !isValidEmail(self.username) {
        missingDetails += "email"
      }
      
      if self.password == nil || self.password?.count == 0 {
        if !missingDetails.isEmpty {
          missingDetails += " and password are"
        } else {
          missingDetails += "password is"
        }
      } else if !missingDetails.isEmpty {
        missingDetails += " is"
      }
      
      delegate?.loginViewModel(self,
                               updateTextFieldLineColor: usernameColor,
                               passwordColor: passwordColor)
      delegate?.loginViewModel(self,
                               showAlertControllerWithTitle: R.string.localizable.loginError(),
                               message: R.string.localizable.yourInvalidKindlyCheckAndTryAgain(missingDetails))
      return
    }
    
    let filteredPersons = persons.filter { $0.username == username && $0.password == password }
    guard let _ = filteredPersons.first else {
      delegate?.loginViewModel(self,
                               showAlertControllerWithTitle: R.string.localizable.loginError(),
                               message: R.string.localizable.yourEmailOrPasswordIsIncorrectKindlyCheckAndTryAgain())
      return
    }
    
    DispatchQueue.main.async {
      self.appDelegate.showHome()
      self.delegate?.loginViewModelDismissLoadingView(self)
      self.appInfoHelper.appUserDefaults.setIsLoggedIn(true)
    }
    
  }
  
  var delegate: LoginViewModelDelegate?
  var username: String?
  var password: String?
  
  private var passwordTappedClosure: (() -> Void)? { {
    self.isPasswordVisibilityOn = !self.isPasswordVisibilityOn
    self.isSecureTextEntry = !self.isSecureTextEntry
    
    let image = self.isPasswordVisibilityOn ? R.image.visibilityOn()! : R.image.visibilityOff()!
    self.delegate?.loginViewModel(self,
                                  isSecureTextEntry: self.isSecureTextEntry,
                                  updateRightButtonImage: image)
  }
  }
  
  private var databaseManager: DatabaseManagerType
  private var isPasswordVisibilityOn: Bool = true
  private var isSecureTextEntry: Bool = true
  private var persons = [Person]()
  private let appDelegate = UIApplication.shared.delegate as! AppDelegate
  private let appInfoHelper = AppInfoHelper.shared
  
}

private extension LoginViewModel {
  
  func savePersons() {

    persons = databaseManager.read()
    
    for person in persons {
      databaseManager.deleteByID(id: person.id)
    }
    
    databaseManager.insert(id: 0,
                           username: "admin@gmail.com",
                           password: "admin")
    persons = databaseManager.read()
  }
  
  func isValidEmail(_ email: String?) -> Bool {
    guard let email = email,
          !email.isEmpty else {
      return false
    }
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }
  
}
