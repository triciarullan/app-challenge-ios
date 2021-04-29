//
//  TextField.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/28/21.
//

import UIKit
import Foundation

protocol TextFieldViewDelegate: class {
  func textFieldViewShouldReturn(_ textFieldView: TextFieldView) -> Bool
  func textFieldView(_ textFieldView: TextFieldView,
                     shouldChangeCharactersIn range: NSRange,
                     replacementString string: String) -> Bool
  func textFieldViewDidChange(_ textFieldView: TextFieldView)
  func textFieldViewDidEndEditing(_ textFieldView: TextFieldView)
}

extension TextFieldViewDelegate {
  func textFieldViewShouldReturn(_ textFieldView: TextFieldView) -> Bool { true }
  func textFieldView(_ textFieldView: TextFieldView,
                     shouldChangeCharactersIn range: NSRange,
                     replacementString string: String) -> Bool { true }
  func textFieldViewDidChange(_ textFieldView: TextFieldView) { }
  func textFieldViewDidEndEditing(_ textFieldView: TextFieldView) { }
}

class TextFieldView: UIView, NibLoadable {

  @IBOutlet weak private var leftIconImageView: UIImageView!
  @IBOutlet weak var rightButton: UIButton!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var lineSeparatorView: UIView!
  
  var viewModel: TextViewModelType! {
    didSet {
      bindViewModel()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    commonInit()
  }
  
  @IBAction private func didTapRightButton(_ sender: Any) {
    viewModel.rightButtonTappedClosure?()
  }

  // MARK: - Internals
  weak var delegate: TextFieldViewDelegate?

  // MARK: - Privates

  private func commonInit() {
    setUpLoadableView()
    configureViews()
  }

  private func configureViews() {
    textField.delegate = self
    textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
  }

  private func bindViewModel() {
    textField.placeholder = viewModel.placeholderText
    leftIconImageView.image = viewModel.leftIconImage
    
    rightButton.isHidden = viewModel.rightIconImage == nil
    
    if let iconImage = viewModel.rightIconImage {
      rightButton.setImage(iconImage, for: .normal)
    }
    
  }

  @objc private func textFieldDidChange(_ textField: UITextField) {
    delegate?.textFieldViewDidChange(self)
  }

}

// MARK: - UITextFieldDelegate

extension TextFieldView: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    delegate?.textFieldViewShouldReturn(self) ?? true
  }

  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    delegate?.textFieldView(self, shouldChangeCharactersIn: range, replacementString: string) ?? true
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    delegate?.textFieldViewDidEndEditing(self)
  }
}
