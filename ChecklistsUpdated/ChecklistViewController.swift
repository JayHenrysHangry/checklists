//
//  ViewController.swift
//  ChecklistsUpdated
//
//  Created by Jay Henry on 9/27/17.
//  Copyright © 2017 Jay Henry. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //CHANGE
    }
    
    override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView,
                            
                            // Below cellForRowAt method is to deliver a new or recycled cell object to the table view when a row becomes visible.
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem",
                for: indexPath)
            
            let label = cell.viewWithTag(1000) as! UILabel
            
            /*if indexPath.row == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row == 2 {
                label.text = "Lean iOS development"
            } else if indexPath.row == 3 {
                label.text = "Soccer practice"
            } else if indexPath.row == 4 {
                label.text = "Eat ice cream"
            }*/
            
            if indexPath.row % 5 == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row % 5 == 2 {
                label.text = "Learn iOS development"
            } else if indexPath.row % 5 == 3 {
                label.text = "Soccer practice"
            } else if indexPath.row % 5 == 4 {
                label.text = "Eat ice cream"
            }
            
            return cell
    }
    
    // Makes it so when you tap a cell it no longer fully turns gray and stays. Now it turns gray but then fades away.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Theoretically it's possible there's no cell at the specified indexPath. The code after the if let is only executed if there is a UITableViewCell object. (Technically in this app there will always be, but swift doesn't know that).
        if let cell = tableView.cellForRow(at: indexPath) { // Note: this is not the same method as tableView(_:cellForRowAt:) from above. It's job is to return a cell object of an existing cell for a row that is currently being displayed.
            
            // The checkmark is part of the cell as the accessory.
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

