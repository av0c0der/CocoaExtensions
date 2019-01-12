//
//  NSAttributedString.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 29/12/2018.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public extension NSAttributedString {

  public var mutable: NSMutableAttributedString {
    return mutableCopy() as! NSMutableAttributedString
  }

}
