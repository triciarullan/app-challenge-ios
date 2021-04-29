//
//  UIView+.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import SnapKit

extension UIView {

  func roundCorners(radius: CGFloat? = nil,
                    borderColor: UIColor? = nil,
                    borderWidth: CGFloat = 0.0) {
    clipsToBounds = true
    layer.cornerRadius = radius ?? (min(bounds.height, bounds.width) * 0.5)
    layer.borderColor = borderColor?.cgColor
    layer.borderWidth = borderWidth
  }
  
}
