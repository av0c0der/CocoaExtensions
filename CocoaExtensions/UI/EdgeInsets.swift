//
//  UIEdgeInsets.swift
//  CocoaExtensions-tvOS
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
  
  init(_ padding: CGFloat, sidePadding: CGFloat? = nil) {
    self = EdgeInsets(top: padding, left: sidePadding ?? padding, bottom: padding, right: sidePadding ?? padding)
  }
  
  init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil, otherSides: CGFloat? = nil) {
    let rightSide = right ?? otherSides ?? 0
    let topSide = top ?? otherSides ?? 0
    let leftSide = left ?? otherSides ?? 0
    let bottomSide = bottom ?? otherSides ?? 0
    self = EdgeInsets(top: topSide, left: leftSide, bottom: bottomSide, right: rightSide)
  }
  
}
