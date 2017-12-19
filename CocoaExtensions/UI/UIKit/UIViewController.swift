//
//  UIViewController.swift
//  CocoaExtensions
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

// MARK: - Push
public extension UIViewController {
  
  /// Push new view controller with a horizontal slide transition. Has no effect if the view controller is already in the stack.
  public func push(_ vc: UIViewController, animated: Bool = true) {
    if let navi = self as? UINavigationController {
      navi.pushViewController(vc, animated: animated)
    } else {
      navigationController?.pushViewController(vc, animated: animated)
    }
  }
  
}
  
#endif

#if os(iOS)
// MARK: - LargeTitleDisplayMode
public extension UIViewController {

  /// Mirrors UIKit enumeration.
  /// Was declared to avoid multiple iOS version checks.
  public enum LargeTitleDisplayMode: Int {
    case automatic, always, never
  }
  
  /// When UINavigationBar.prefersLargeTitles=YES, this property controls when the larger out-of-line title is displayed. If prefersLargeTitles=NO, this property has no effect. The default value is Automatic.
  public var largeTitleDisplayMode: LargeTitleDisplayMode {
    get {
      var raw = 2
      if #available(iOS 11.0, *) {
        raw = navigationItem.largeTitleDisplayMode.rawValue
      }
      return LargeTitleDisplayMode(rawValue: raw) ?? .never
    } set {
      if #available(iOS 11.0, *) {
        let raw = newValue.rawValue
        let mode = UINavigationItem.LargeTitleDisplayMode(rawValue: raw) ?? .automatic
        navigationItem.largeTitleDisplayMode = mode
      }
    }
  }
  
  /// When set to YES, the navigation bar will use a larger out-of-line title view when requested by the current navigation item. To specify when the large out-of-line title view appears, see UINavigationItem.largeTitleDisplayMode. Defaults to NO.
  public var prefersLargeTitles: Bool {
    get {
      if #available(iOS 11, *) {
        if let navi = self as? UINavigationController {
          return navi.navigationBar.prefersLargeTitles
        } else {
          return navigationController?.navigationBar.prefersLargeTitles ?? false
        }
      } else {
        return false
      }
    } set {
      if #available(iOS 11, *) {
        if let navi = self as? UINavigationController {
          navi.navigationBar.prefersLargeTitles = newValue
        } else {
          navigationController?.navigationBar.prefersLargeTitles = newValue
        }
      }
    }
  }
  
}

#endif
