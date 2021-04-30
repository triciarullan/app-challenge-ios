//
//  LoginViewController.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/28/21.
//

import UIKit

class LoginViewController: BaseViewController, BindableType {
  
  @IBOutlet weak private var usernameTextFieldView: TextFieldView!
  @IBOutlet weak private var passwordTextFieldView: TextFieldView!
  @IBOutlet weak private var loginButton: UIButton!
  
  var viewModel: LoginViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViews()
  }
  
  func bindViewModel() {
    viewModel.delegate = self
    
    usernameTextFieldView.viewModel = viewModel.getUserNameTextFieldViewModel()
    usernameTextFieldView.delegate = self
    passwordTextFieldView.viewModel = viewModel.getPasswordTextFieldViewModel()
    passwordTextFieldView.textField.isSecureTextEntry = true
    passwordTextFieldView.delegate = self
  }
  
  @IBAction func didTapLoginButton(_ sender: Any) {
    viewModel.submitLogin()
  }
}

private extension LoginViewController {

  func configureViews() {
    loginButton.roundCorners()
  }
  
}


// MARK: - TextFieldViewDelegate

extension LoginViewController: TextFieldViewDelegate {

  func textFieldViewDidChange(_ textFieldView: TextFieldView) {
    if  textFieldView == usernameTextFieldView {
      viewModel.username = textFieldView.textField.text
    } else if textFieldView == passwordTextFieldView {
      viewModel.password = textFieldView.textField.text
    }
  }

  func textFieldViewShouldReturn(_ textFieldView: TextFieldView) -> Bool {
    textFieldView.textField.resignFirstResponder()
  }

}

extension LoginViewController: LoginViewModelDelegate {
  
  func loginViewModelDismissLoadingView(_ viewModel: LoginViewModelType) {
    dismissLoadingView()
  }
  
  func loginViewModel(_ viewModel: LoginViewModelType,
                      showAlertControllerWithTitle title: String,
                      message: String) {
    showAlertController(title: title,
                        message: message)
    dismissLoadingView()
  }
  
  func loginViewModelShowLoadingView(_ viewModel: LoginViewModelType) {
    showLoadingView()
  }
  
  func loginViewModel(_ viewModel: LoginViewModelType,
                      updateTextFieldLineColor usernameColor: UIColor,
                      passwordColor: UIColor) {
    usernameTextFieldView.lineSeparatorView.backgroundColor = usernameColor
    passwordTextFieldView.lineSeparatorView.backgroundColor = passwordColor
  }
  
  func loginViewModel(_ viewModel: LoginViewModelType,
                      isSecureTextEntry: Bool,
                      updateRightButtonImage image: UIImage) {
    DispatchQueue.main.async {
      self.passwordTextFieldView.textField.isSecureTextEntry = isSecureTextEntry
      self.passwordTextFieldView.rightButton.setImage(image, for: .normal)
    }
  }
}
