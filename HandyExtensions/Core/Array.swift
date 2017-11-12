//
//  Array.swift
//  HandyExtensions
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

import Foundation

public extension Array {
  
  public var random: Element {
    let index = Int(arc4random_uniform(UInt32(count-1)))
    return self[index]
  }
  
}
