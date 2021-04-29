//
//  TextFieldViewModel.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//


import Foundation
import UIKit

protocol TextViewModelType {
  var leftIconImage: UIImage? { get }
  var rightIconImage: UIImage? { get }
  var placeholderText: String { get }
  var rightButtonTappedClosure: (() -> Void)? { get set }
}

struct TextViewModel: TextViewModelType {

  init(placeholderText: String,
       leftIconImage: UIImage?,
       rightIconImage: UIImage? = nil,
       rightButtonTappedClosure: (() -> Void)? = nil) {
    self.placeholderText = placeholderText
    self.leftIconImage = leftIconImage
    self.rightIconImage = rightIconImage
    self.rightButtonTappedClosure = rightButtonTappedClosure
  }

  var placeholderText: String
  var leftIconImage: UIImage?
  var rightIconImage: UIImage?
  var rightButtonTappedClosure: (() -> Void)?
}
