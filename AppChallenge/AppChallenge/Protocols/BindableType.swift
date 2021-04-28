//
//  BindableType.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/22/20.
//  Copyright © 2020 ShareInvestor. All rights reserved.
//

import UIKit

protocol BindableType {

  associatedtype ViewModelType

  var viewModel: ViewModelType! { get set }

  func bindViewModel()

}

extension BindableType where Self: UIViewController {

  mutating func bindViewModel(to model: Self.ViewModelType) {
    viewModel = model
    loadViewIfNeeded()
    bindViewModel()
  }

}

extension BindableType where Self: UITableViewCell {

  mutating func bindViewModel(to model: Self.ViewModelType) {
    viewModel = model
    bindViewModel()
  }

}

extension BindableType where Self: UICollectionViewCell {

  mutating func bindViewModel(to model: Self.ViewModelType) {
    viewModel = model
    bindViewModel()
  }

}
