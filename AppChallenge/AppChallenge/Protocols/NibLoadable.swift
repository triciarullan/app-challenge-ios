//
//  NibLoadable.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/22/20.
//  Copyright © 2020 ShareInvestor. All rights reserved.
//

import SnapKit

protocol NibLoadable {
  func setUpLoadableView()
}

extension NibLoadable where Self: UIView {

  func setUpLoadableView() {
    if let view = viewFromNib() {
      addSubview(view)
      view.snp.makeConstraints { maker in
        maker.edges.equalTo(self)
      }
    }
  }

  private func viewFromNib() -> UIView? {
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
    if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
      return view
    }
    return nil
  }

}
