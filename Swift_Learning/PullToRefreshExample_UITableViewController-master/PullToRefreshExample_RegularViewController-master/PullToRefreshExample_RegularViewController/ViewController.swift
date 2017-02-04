//
//  ViewController.swift
//  PullToRefreshExample_RegularViewController
//
//  Created by Andrew Bancroft on 3/16/15.
//  Copyright (c) 2015 Andrew Bancroft. All rights reserved.
//

import UIKit

struct Movie {
	let title: String
	let genre: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	
	var movies = [
		Movie(title: "Lion King", genre: "Animation"),
		Movie(title: "Star Wars", genre: "Sci-fi")
	]
	
	lazy var refreshControl: UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		refreshControl.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
		
		return refreshControl
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.tableView.addSubview(self.refreshControl)
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
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		
		cell.textLabel?.text = movies[(indexPath as NSIndexPath).row].title
		cell.detailTextLabel?.text = movies[(indexPath as NSIndexPath).row].genre
		
		return cell
	}
}
