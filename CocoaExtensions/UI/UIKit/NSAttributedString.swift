//
//  NSAttributedString.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 29/12/2018.
//

import UIKit

public extension NSAttributedString {

  public var mutable: NSMutableAttributedString {
    return mutableCopy() as! NSMutableAttributedString
  }

}
