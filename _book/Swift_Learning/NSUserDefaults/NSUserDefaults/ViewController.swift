//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Bob Lee on 12/18/16.
//  Copyright © 2016 BobtheDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let defaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()

    getUserDefaultsInt()
    getUserDefaultDict()
    getUserDefaultColor()

  }
  
  func getUserDefaultsInt() {
    defaults.set(20, forKey: "myAge")
    print(defaults.integer(forKey: "myAge"))
    defaults.set(21, forKey: "myAge")
    print(defaults.integer(forKey: "myAge"))
  }
  
  func getUserDefaultDict() {
    let name = ["Real": "SangJoon Lee"]
    
    // First Method
    defaults.set(name, forKey: "name")
    if let name = defaults.value(forKey: "name") as? [String: String] {
      print(name) // Downcast from Any? to [String: String]
    }
  
  
    
    // Second Method
    if let name = defaults.dictionary(forKey: "name") as? [String: String] {
      print(name) // Downcast from [String : Any]? to [String: String]
    }
  }
  
  func getUserDefaultColor() {
    defaults.setColor(color: UIColor.red, forKey: "myColor")
    let myColor = defaults.colorForKey(key: "myColor")
  }
  
}
