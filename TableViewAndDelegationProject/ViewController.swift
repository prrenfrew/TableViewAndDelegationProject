//
//  ViewController.swift
//  TableViewAndDelegationProject
//
//  Created by MAC on 9/2/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var greetings = ["Hello", "Good Morning", "Good Day", "Good Evening"]
  @IBOutlet weak var tableView: UITableView!

//  override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view.
//  }
//
//  override func viewWillAppear(_ animated: Bool) {
//    <#code#>
//  }
//
//  override func viewDidAppear(_ animated: Bool) {
//    <#code#>
//  }
//
//  override func viewWillDisappear(_ animated: Bool) {
//    <#code#>
//  }
//
//  override func viewDidDisappear(_ animated: Bool) {
//    <#code#>
//  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.greetings.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "basicCell")
    cell.textLabel?.text = self.greetings[indexPath.row]
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    /*
     present - Present a modal view
     This should be used when we want to interrupt the user to quickly do something
     
     Navigation controller - this should be used as a way to continue the flow
     */
//    detailViewController.loadViewIfNeeded()
//    _ = detailViewController.view
    detailViewController.greeting = self.greetings[indexPath.row]
    detailViewController.delegate = self
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }
}

extension ViewController: DetailViewControllerDelegate {
  func updateGreeting(with greeting: String) {
    guard let updateIndex = self.tableView.indexPathForSelectedRow?.row else { return }
    self.greetings[updateIndex] = greeting
    self.tableView.reloadData()
  }
}
