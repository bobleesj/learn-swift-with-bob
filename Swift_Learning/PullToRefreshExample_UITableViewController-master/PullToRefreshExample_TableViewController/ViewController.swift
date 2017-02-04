//
//  ViewController.swift
//  PullToRefreshExample_TableViewController
//
//  Created by Andrew Bancroft on 3/16/15.
//  Copyright (c) 2015 Andrew Bancroft. All rights reserved.
//

import UIKit

struct Movie {
	let title: String
	let genre: String
}

class ViewController: UITableViewController {

	var movies = [
		Movie(title: "Lion King", genre: "Animation"),
		Movie(title: "Star Wars", genre: "Sci-fi")
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.refreshControl?.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: .valueChanged)
	}
	
	func handleRefresh(_ refreshControl: UIRefreshControl) {
		// Do some reloading of data and update the table view's data source
		// Fetch more objects from a web service, for example...
		
		// Simply adding an object to the data source for this example
		let newMovie = Movie(title: "Serenity", genre: "Sci-fi")
		movies.append(newMovie)
		
		movies.sort() { $0.title < $1.title }
  
		self.tableView.reloadData()
		refreshControl.endRefreshing()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		
		cell.textLabel?.text = movies[(indexPath as NSIndexPath).row].title
		cell.detailTextLabel?.text = movies[(indexPath as NSIndexPath).row].genre
		
		return cell
	}
}
