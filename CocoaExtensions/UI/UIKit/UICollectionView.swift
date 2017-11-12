//
//  UICollectionView.swift
//  CocoaExtensions-macOS
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

#if os(OSX)
  // Skip macOS
#else
  
import UIKit

public extension UICollectionView {
  
  public func register<T: UICollectionViewCell>(_: T.Type) {
    register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
  }
  
  public func registerNib<T: UICollectionViewCell>(_:T.Type) {
    let nib = UINib(nibName: String(describing: T.self), bundle: nil)
    register(nib, forCellWithReuseIdentifier: String(describing: T.self))
  }
  
  public func dequeue<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
  }
  
}

#endif
