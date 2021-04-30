//
//  UserViewController.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import UIKit

class UserViewController: BaseViewController, BindableType {
  
  @IBOutlet weak private var tableView: UITableView!
  
  var viewModel: UserViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerViews()
    configureViews()
  }
  
  func bindViewModel() {
    viewModel.delegate = self
  }
  
  @IBAction private func didTapLogoutButton(_ sender: Any) {
    viewModel.logout()
  }
  
}

private extension UserViewController {
  
  func configureViews() {
    
    title = viewModel.title
  }
  
  func registerViews() {
    tableView.register(R.nib.userTableViewCell)
  }
 
}

// MARK: - UITableViewDataSource

extension UserViewController: UITableViewDataSource {
  
  func  numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.sectionModels.count
  }
  
  func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.sectionModels[section].items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let itemModel = viewModel.itemModel(at: indexPath)
    let cell = tableView.dequeueReusableCell(withIdentifier: itemModel.reuseIdentifier, for: indexPath)
    if let cell = cell as? UserSectionItemModelBindableType {
      cell.bindItemModel(to: itemModel)
    }
    return cell
  }
  
}

// MARK: - UITableViewDelegate

extension UserViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    viewModel.didSelect(at: indexPath)
  }
  
}

extension UserViewController: UserViewModelDelegate {
  
  func userViewModelNeedsReloadData(_ vieWModel: UserViewModelType) {
    tableView.reloadData()
  }
  
}
