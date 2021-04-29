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

  init() {
    
  }
  
  func getUserNameTextFieldViewModel() -> TextViewModel {
    let viewModel = TextViewModel(placeholderText: R.string.localizable.username(),
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
  
    guard let username = username, !username.isEmpty,
          let password = password, !password.isEmpty else {
      let usernameColor: UIColor = self.username?.isEmpty ?? true ? R.color.warning()! : R.color.osloGrey()!
      let passwordColor: UIColor = self.password?.isEmpty ?? true ? R.color.warning()! : R.color.osloGrey()!
      delegate?.loginViewModel(self,
                               updateTextFieldLineColor: usernameColor,
                               passwordColor: passwordColor)
      delegate?.loginViewModel(self,
                               showAlertControllerWithTitle: R.string.localizable.loginError(),
                               message: R.string.localizable.yourUsernameOrPasswordIsIncorrectKindlyCheckAndTryAgain())
      return
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
  
  private var isPasswordVisibilityOn: Bool = true
  private var isSecureTextEntry: Bool = true
  
}
