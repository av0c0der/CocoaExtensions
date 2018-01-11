//
//  UIButton+TouchArea.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 11/01/2018.
//

import UIKit


private var pTouchAreaEdgeInsets: UIEdgeInsets = .zero

extension UIButton {
  
  /// Touchable area of the button.
  /// Default is `.zero`. Provide insets with negative values to expand the touchable area.
  var touchAreaEdgeInsets: UIEdgeInsets {
    get {
      guard let value = objc_getAssociatedObject(self, &pTouchAreaEdgeInsets) as? NSValue else { return .zero }
      var edgeInsets: UIEdgeInsets = .zero
      value.getValue(&edgeInsets)
      return edgeInsets
    } set {
      var newValueCopy = newValue
      let objCType = NSValue(uiEdgeInsets: .zero).objCType
      let value = NSValue(&newValueCopy, withObjCType: objCType)
      objc_setAssociatedObject(self, &pTouchAreaEdgeInsets, value, .OBJC_ASSOCIATION_RETAIN)
    }
  }
  
  override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    
    // Do nothing if insets is `.zero` or button is hidden or not enabled.
    if UIEdgeInsetsEqualToEdgeInsets(self.touchAreaEdgeInsets, .zero) || !self.isEnabled || self.isHidden {
      return super.point(inside: point, with: event)
    }
    
    let hitFrame = UIEdgeInsetsInsetRect(bounds, self.touchAreaEdgeInsets)
    return hitFrame.contains(point)
  }
  
}
