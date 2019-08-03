//
//  FileManager.swift
//  CocoaExtensions
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

import Foundation

public extension FileManager {
  
  var documentsURL: URL {
    return urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
  }
  
}
