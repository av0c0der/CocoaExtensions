//
//  UITableView.swift
//  HandyExtensions
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
  public func disableDelay() {
    delaysContentTouches = false
    for case let x as UIScrollView in subviews {
      x.delaysContentTouches = false
    }
  }
  
  /// Change TableView's height with animation
  public func animateRowHeightChange() {
    beginUpdates()
    endUpdates()
  }
  
  // MARK: - Register/Dequeue
  public func register<T: UITableViewCell>(_: T.Type) {
    register(T.self, forCellReuseIdentifier: String(describing: T.self))
  }
  
  public func registerNib<T: UITableViewCell>(_:T.Type) {
    let nib = UINib(nibName: String(describing: T.self), bundle: nil)
    register(nib, forCellReuseIdentifier: String(describing: T.self))
  }
  
  public func dequeue<T: UITableViewCell>(_: T.Type) -> T {
    return dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T ?? T()
  }
  
  
  // MARK: - Header & Footer
  public func registerNibHeader<T: UIView>(_: T.Type) {
    let nib = UINib(nibName: String(describing: T.self), bundle: nil)
    register(nib, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
  }
  
  public func dequeueHeaderFooter<T: UIView>(_: T.Type) -> T {
    return dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as! T
  }
  
}

#endif
