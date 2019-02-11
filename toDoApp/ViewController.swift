//
//  ViewController.swift
//  firstApp
//
//  Created by Hasan genç on 24.08.2018.
//  Copyright © 2018 Hasan genç. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // This only happens when editing an existing item.
      if let item = item {
        nameTextField.text = item.name
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  var item : Item?
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var saveButton: UIBarButtonItem!

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if sender as AnyObject? === saveButton {
      let name = nameTextField.text ?? ""
      item = Item(name: name)
    }
  }
  
  @IBAction func cancel(sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
}

