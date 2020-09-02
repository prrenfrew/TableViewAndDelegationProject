//
//  DetailViewController.swift
//  TableViewAndDelegationProject
//
//  Created by MAC on 9/2/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
  func updateGreeting(with greeting: String)
}

class DetailViewController: UIViewController {
  var greeting: String?
  var delegate: DetailViewControllerDelegate?
  @IBOutlet weak var greetingTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.greetingTextField.text = self.greeting
  }
  
  @IBAction func saveGreeting(_ sender: Any) {
    self.greeting = self.greetingTextField.text
    if let greeting = self.greetingTextField.text {
      self.delegate?.updateGreeting(with: greeting)
    }
    self.navigationController?.popViewController(animated: true)
  }
}
