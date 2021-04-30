//
//  UserTableViewCell.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  
  @IBOutlet weak private var idLabel: UILabel!
  @IBOutlet weak private var numberContainerView: UIView!
  @IBOutlet weak private var nameLabel: UILabel!
  @IBOutlet weak private var emailLabel: UILabel!
  @IBOutlet weak private var phoneLabel: UILabel!
  
  var viewModel: UserTableCellViewModelType!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configureViews()
  }
  
}

private extension UserTableViewCell {
  
  func configureViews() {
    numberContainerView.roundCorners()
  }
}

// MARK: - BindableType, UserSectionItemModelBindableType

extension UserTableViewCell: BindableType, UserSectionItemModelBindableType {

  func bindViewModel() {
    idLabel.text = viewModel.id
    nameLabel.text = viewModel.name
    emailLabel.text = viewModel.email
    phoneLabel.text = viewModel.phone
  }

}
