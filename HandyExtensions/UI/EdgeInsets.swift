//
//  UIEdgeInsets.swift
//  HandyExtensions-tvOS
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

#if os(OSX)
  import AppKit
  typealias EdgeInsets = NSEdgeInsets
#elseif os(iOS) || os(tvOS)
  import UIKit
  typealias EdgeInsets = UIEdgeInsets
#endif


public extension EdgeInsets {
  
  public init(_ padding: CGFloat, sidePadding: CGFloat? = nil) {
    top = padding
    bottom = padding
    left = sidePadding ?? padding
    right = sidePadding ?? padding
  }
  
  public init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil, otherSides: CGFloat? = nil) {
    self.top = top ?? otherSides ?? 0
    self.left = left ?? otherSides ?? 0
    self.bottom = bottom ?? otherSides ?? 0
    self.right = right ?? otherSides ?? 0
  }
  
}
