//
//  Collection.swift
//  CocoaExtensions
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

import Foundation

public extension Collection {
  
  /// Returns the element at the specified index if it is within bounds, otherwise nil.
  public subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
