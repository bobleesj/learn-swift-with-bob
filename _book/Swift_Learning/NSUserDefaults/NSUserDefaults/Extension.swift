//
//  Extension.swift
//  NSUserDefaults
//
//  Created by Bob Lee on 12/20/16.
//  Copyright © 2016 BobtheDeveloper. All rights reserved.
//

import Foundation
import UIKit


extension UserDefaults {
  
  func colorForKey(key: String) -> UIColor? {
    var color: UIColor?
    if let colorData = data(forKey: key) {
      
      color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
    }
    return color
    
  }
  
  func setColor(color: UIColor?, forKey key: String) {
    var colorData: NSData?
    if let color = color {
      colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
    }
    set(colorData, forKey: key)
  }
  

}
