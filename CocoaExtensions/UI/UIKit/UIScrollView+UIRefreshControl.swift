//
//  UIScrollView.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 12/01/2019.
//

#if os(iOS)

import UIKit

public extension UIScrollView {

  static var refreshControlTag: Int {
    return 10001
  }

  func addRefreshControl(_ refreshControl: UIRefreshControl, tag: Int = UIScrollView.refreshControlTag) {
    if #available(iOS 10.0, *) {
      self.refreshControl = refreshControl
    } else {
      refreshControl.tag = tag
      addSubview(refreshControl)
    }
  }

  func removeRefreshControl() {
    if #available(iOS 10.0, *) {
      self.refreshControl = nil
    } else {
      guard let refreshControl = viewWithTag(UIScrollView.refreshControlTag) else {
        return
      }
      refreshControl.removeFromSuperview()
    }
  }

}

#endif
