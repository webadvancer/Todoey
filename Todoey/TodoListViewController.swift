//
//  ViewController.swift
//  Todoey
//
//  Created by Paul Christopher Little on 6/25/18.
//  Copyright © 2018 Web Advancer. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   var itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      if let items = UserDefaults.standard.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
    
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
        override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            

            cell.textLabel?.text = itemArray[indexPath.row]
            
            return cell

}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else {
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    // add new item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
     let alert = UIAlertController(title: "Add New Todoey Item", message: "" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
       
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
           textField = alertTextField
        
          
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    }
}
