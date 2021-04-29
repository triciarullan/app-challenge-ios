//
//  UIAlertController+.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import UIKit

struct AlertItemConstants {
  static let tagContinue = 100
  static let tagCancel = 101
}

typealias AlertControllerCallback = (Int) -> Void

struct AlertItem {

  var title: String?
  var message: String?
  var tintColor: UIColor?
  var actions: [AlertAction] = [AlertAction.defaultAction]

  init(title: String? = nil,
       message: String? = nil,
       tintColor: UIColor? = nil,
       actions: [AlertAction] = [AlertAction.defaultAction]) {
    self.title = title
    self.message = message
    self.tintColor = tintColor
    self.actions = actions
  }

}

struct AlertAction {

  var title: String?
  var tag: Int
  var style: UIAlertAction.Style

  init(title: String?, tag: Int = 0, style: UIAlertAction.Style = .default) {
    self.title = title
    self.tag = tag
    self.style = style
  }

  static var defaultAction: AlertAction {
    return AlertAction(title: "OK")
  }

}


extension UIAlertController {

  @discardableResult
  static func presentAlert(in viewController: UIViewController,
                           item: AlertItem,
                           tapClosure: AlertControllerCallback?) -> UIAlertController {
    return presentAlert(in: viewController,
                        title: item.title,
                        message: item.message,
                        tintColor: item.tintColor,
                        actions: item.actions,
                        tapClosure: tapClosure)
  }

  @discardableResult
  static func presentActionSheet(in viewController: UIViewController,
                                 item: AlertItem,
                                 tapClosure: AlertControllerCallback?) -> UIAlertController {
    return presentActionSheet(in: viewController,
                              title: item.title,
                              message: item.message,
                              tintColor: item.tintColor,
                              actions: item.actions,
                              tapClosure: tapClosure)
  }

  @discardableResult
  static func presentAlert(in viewController: UIViewController,
                           title: String? = nil,
                           message: String? = nil,
                           tintColor: UIColor? = nil,
                           textFieldText: String? = nil,
                           actions: [AlertAction] = [AlertAction.defaultAction],
                           tapClosure: AlertControllerCallback?) -> UIAlertController {
    return present(in: viewController,
                   title: title,
                   message: message,
                   style: .alert,
                   tintColor: tintColor,
                   actions: actions,
                   tapClosure: tapClosure)
  }

  @discardableResult
  static func presentActionSheet(in viewController: UIViewController,
                                 title: String? = nil,
                                 message: String? = nil,
                                 tintColor: UIColor? = nil,
                                 actions: [AlertAction] = [AlertAction.defaultAction],
                                 tapClosure: AlertControllerCallback?) -> UIAlertController {
    return present(in: viewController,
                   title: title,
                   message: message,
                   style: .actionSheet,
                   tintColor: tintColor,
                   actions: actions,
                   tapClosure: tapClosure)
  }

  private static func present(in viewController: UIViewController,
                              title: String? = nil,
                              message: String? = nil,
                              style: UIAlertController.Style,
                              tintColor: UIColor? = nil,
                              actions: [AlertAction] = [AlertAction.defaultAction],
                              tapClosure: AlertControllerCallback?) -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)

    if let controller = alertController.popoverPresentationController {
      controller.sourceView = viewController.view
      controller.sourceRect = CGRect(x: viewController.view.bounds.midX,
                                     y: viewController.view.bounds.maxY,
                                     width: 0,
                                     height: 0)
      controller.permittedArrowDirections = UIPopoverArrowDirection.any
    }

    if let tintColor = tintColor {
      alertController.view.tintColor = tintColor
    }

    actions.forEach { action in
      let action = UIAlertAction(title: action.title, style: action.style) { _ in
        tapClosure?(action.tag)
      }
      alertController.addAction(action)
    }

    viewController.present(alertController, animated: true, completion: nil)

    return alertController
  }

}
