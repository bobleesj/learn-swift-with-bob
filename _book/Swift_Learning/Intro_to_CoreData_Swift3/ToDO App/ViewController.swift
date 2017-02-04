//
//  ViewController.swift
//  ToDO App
//
//  Created by Bob Lee on 12/24/16.
//  Copyright © 2016 BobtheDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

  var tasks: [Task] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getData()
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    let task = tasks[indexPath.row]
    
    if let myName = task.name {
      cell.textLabel?.text = myName
    }
    
    return cell
   }

  func getData() {
    do {
      tasks = try context.fetch(Task.fetchRequest())
    }
    catch {
      print("Fetching Failed")
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
      let task = tasks[indexPath.row]
      context.delete(task)
      (UIApplication.shared.delegate as! AppDelegate).saveContext()
      
      do {
        tasks = try context.fetch(Task.fetchRequest())
      }
      catch {
        print("Fetching Failed")
      }
    }
    tableView.reloadData()
  }
}

