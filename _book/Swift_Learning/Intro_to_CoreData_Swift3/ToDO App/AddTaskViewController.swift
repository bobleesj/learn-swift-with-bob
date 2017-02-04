//
//  AddTaskViewController.swift
//  ToDO App
//
//  Created by Bob Lee on 12/24/16.
//  Copyright © 2016 BobtheDeveloper. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

  @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func buttonTapped(_ sender: UIButton) {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let task = Task(context: context)
    task.name = taskTextField.text!
    // Save the data to coredata
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    let _ = navigationController?.popViewController(animated: true)
  }

}
