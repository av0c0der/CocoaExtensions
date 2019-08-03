//
//  UITableView.swift
//  CocoaExtensions
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

#if os(OSX)
  // Skip macOS
#else

import UIKit

public extension UITableView {
  
  // MARK: - Configuration
  /// Disable touches delay
  func disableDelay() {
    delaysContentTouches = false
    for case let x as UIScrollView in subviews {
      x.delaysContentTouches = false
    }
  }
  
  /// Change TableView's height with animation
  func animateRowHeightChange() {
    beginUpdates()
    endUpdates()
  }
  
  // MARK: - Register/Dequeue
  func register<T: UITableViewCell>(_: T.Type) {
    register(T.self, forCellReuseIdentifier: String(describing: T.self))
  }
  
  func registerNib<T: UITableViewCell>(_:T.Type) {
    let nib = UINib(nibName: String(describing: T.self), bundle: nil)
    register(nib, forCellReuseIdentifier: String(describing: T.self))
  }
  
  func dequeue<T: UITableViewCell>(_: T.Type) -> T {
    return dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T ?? T()
  }
  
  
  // MARK: - Header & Footer
  func registerNibHeader<T: UIView>(_: T.Type) {
    let nib = UINib(nibName: String(describing: T.self), bundle: nil)
    register(nib, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
  }
  
  func dequeueHeaderFooter<T: UIView>(_: T.Type) -> T {
    return dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as! T
  }
  
}

#endif
