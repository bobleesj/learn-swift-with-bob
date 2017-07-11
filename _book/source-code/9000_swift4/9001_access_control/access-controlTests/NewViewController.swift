//
//  NewViewController.swift
//  access-control
//
//  Created by Bob Lee on 7/8/17.
//  Copyright © 2017 BobtheDeveloper. All rights reserved.
//

import UIKit

// 1. Turn it into fileprivate
fileprivate class NewViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

// 3. Learn what it means to use Internal
internal class AnotherViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // 2. access newViewController to show that it appears while it doesn't
  // in ViewController
  fileprivate let newViewController = NewViewController()
}

// Talking about module: Framework
// UIKit





