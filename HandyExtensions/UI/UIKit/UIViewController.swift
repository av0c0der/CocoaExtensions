//
//  UIViewController.swift
//  HandyExtensions
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

#if os(OSX)
  // Skip macOS
#else

import UIKit

public extension UIViewController {
  
  public var bar: UINavigationBar? {
    return navigationController?.navigationBar
  }
  
  public var barHeight: CGFloat {
    return bar?.bounds.height ?? 0
  }
  
}

#endif
