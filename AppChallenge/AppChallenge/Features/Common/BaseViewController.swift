//
//  BaseViewController.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func showLoadingView(withText text: String = R.string.localizable.loading(),
                       maskType: SVProgressHUDMaskType = .clear,
                       foregroundColor: UIColor = R.color.cello()!) {
    DispatchQueue.main.async {
      SVProgressHUD.setBackgroundColor(.clear)
      SVProgressHUD.setFont(R.font.latoBold(size: 14)!)
      SVProgressHUD.setRingThickness(7)
      SVProgressHUD.show(withStatus: text)
      SVProgressHUD.setDefaultMaskType(maskType)
      SVProgressHUD.setForegroundColor(foregroundColor)
      SVProgressHUD.setBackgroundColor(.white)
    }
  }
  
  func dismissLoadingView() {
    DispatchQueue.main.async {
      SVProgressHUD.dismiss(withDelay: 0.5)
    }
  }
  
  func showAlertController(title: String, message: String) {
    DispatchQueue.main.async {
      let action = AlertAction(title: R.string.localizable.ok().uppercased(),
                               tag: 0,
                               style: .cancel)
      UIAlertController.presentAlert(in: self, title: title,
                                     message: message,
                                     actions: [action],
                                     tapClosure: nil)
    }
  }

}
