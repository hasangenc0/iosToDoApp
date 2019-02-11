//
//  ItemTableViewController.swift
//  firstApp
//
//  Created by Hasan genç on 24.08.2018.
//  Copyright © 2018 Hasan genç. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return items.count
    }
    
    var items  = [Item]()
    /*func loadSampleItems() {
        items += [Item(name:"item1"), Item(name:"item2"), Item(name:"item3")]
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // Load saved items
      if let savedItems = loadItems() {
        items += savedItems
      }
        navigationItem.leftBarButtonItem = editButtonItem

  }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
          let cell = tableView.dequeueReusableCell(
              withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
          // Configure the cell...
      
          let item = items[indexPath.row]
          cell.nameLabel.text = item.name
      
          return cell
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)        
      } else if editingStyle == .insert {
      }
    }
  @IBAction func unwindToList(sender: UIStoryboardSegue) {
    let srcViewCon = sender.source as? ViewController
    let item = srcViewCon?.item
    if  (srcViewCon != nil && item?.name != "") {
      if let selectedIndexPath =  tableView.indexPathForSelectedRow {
          // Update an existing meal.
        items[selectedIndexPath.row] = item!
        tableView.reloadRows(at: [selectedIndexPath], with: .none)
      }else{
        // Add a new item
        let newIndexPath = IndexPath(row: items.count, section: 0)
        items.append(item!)
        tableView.insertRows(at: [newIndexPath], with: .bottom)
      }
      saveItems()
    }
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowDetail" {
      let detailVC = segue.destination as! ViewController
      
      // Get the cell that generated this segue.
      if let selectedCell = sender as? ItemTableViewCell {
        let indexPath = tableView.indexPath(for: selectedCell)!
        let selectedItem = items[indexPath.row]
        detailVC.item = selectedItem
      }
    }
    else if segue.identifier == "Add To Do Item" {
      
    }
  }
  
  func saveItems() {
    let isSaved = NSKeyedArchiver.archiveRootObject(items, toFile: Item.ArchiveURL.path)
    if !isSaved {
      print("Failed to save items...")
    }
  }
  func loadItems() -> [Item]? {
    return NSKeyedUnarchiver.unarchiveObject(
      withFile: Item.ArchiveURL.path) as? [Item]
  }
}
