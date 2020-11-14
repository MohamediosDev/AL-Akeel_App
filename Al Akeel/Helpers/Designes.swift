//
//  Designes.swift
//  Al Akeel
//
//  Created by Mohamed on 9/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import UIKit

class BtnCustomize: UIButton {
    
      override func layoutSubviews() {
          super.layoutSubviews()
          gradientLayer.frame = bounds
      }

      private lazy var gradientLayer: CAGradientLayer = {
          let l = CAGradientLayer()
          l.frame = self.bounds
          l.colors = [UIColor.systemYellow.cgColor, UIColor.orange.cgColor]
          l.startPoint = CGPoint(x: 0, y: 0.5)
          l.endPoint = CGPoint(x: 1, y: 0.5)
          l.cornerRadius =  frame.height * 0.5
          layer.insertSublayer(l, at: 0)
          return l
      }()
    
}
class ViewCustomize: UIView {
    
      override func layoutSubviews() {
          super.layoutSubviews()
          gradientLayer.frame = bounds
      }

      private lazy var gradientLayer: CAGradientLayer = {
          let l = CAGradientLayer()
          l.frame = self.bounds
          l.colors = [UIColor.systemYellow.cgColor, UIColor.orange.cgColor]
          l.startPoint = CGPoint(x: 0, y: 0.5)
          l.endPoint = CGPoint(x: 1, y: 0.5)
          l.cornerRadius =  frame.height * 0.5
          layer.insertSublayer(l, at: 0)
          return l
      }()
    
}
class BtnBorder: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.height * 0.5
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 2
    }


}
class Viewcustom: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 0.5
        layer.shadowOpacity = 0.5
    }
}


