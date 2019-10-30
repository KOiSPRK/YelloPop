//
//  UIButtonExtension.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/26/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit
extension UIButton {
    
    @IBInspectable
      var cornerRadius: CGFloat {
          get {
              return layer.cornerRadius
          }
          set {
              layer.cornerRadius = newValue
          }
      }

      @IBInspectable
      var borderWidth: CGFloat {
          get {
              return layer.borderWidth
          }
          set {
              layer.borderWidth = newValue
          }
      }
      
      @IBInspectable
      var borderColor: UIColor? {
          get {
              if let color = layer.borderColor {
                  return UIColor(cgColor: color)
              }
              return nil
          }
          set {
              if let color = newValue {
                  layer.borderColor = color.cgColor
              } else {
                  layer.borderColor = nil
              }
          }
      }

    func round() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
