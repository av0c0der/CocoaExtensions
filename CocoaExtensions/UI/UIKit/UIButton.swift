//
//  UIButton.swift
//  CocoaExtensions
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

#if os(OSX)
  // Skip macOS
#else

import UIKit

public extension UIButton {
  
  var imageViewContentMode: UIView.ContentMode {
    get {
      return imageView?.contentMode ?? .scaleAspectFit
    } set {
      imageView?.contentMode = newValue
    }
  }
  
}

#endif
