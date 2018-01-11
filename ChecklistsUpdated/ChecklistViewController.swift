//
//  ViewController.swift
//  ChecklistsUpdated
//
//  Created by Jay Henry on 9/27/17.
//  Copyright © 2017 Jay Henry. All rights reserved.
//

import UIKit
//test
class ChecklistViewController: UITableViewController {
    private struct Constant {
        static let NumberOfRows = 100
        static let CellReuseID = "ChecklistItem"
        static let CellLabelTag = 1000
    }
    
    override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection/*external parameter name*/ section/*local parameter name*/: Int) -> Int {
        return Constant.NumberOfRows
    }
    
    override func tableView(_ tableView: UITableView,
                            
                            // Below cellForRowAt method is to deliver a new or recycled cell object to the table view when a row becomes visible.
                            cellForRowAt indexPath: IndexPath) -> //IndexPath is simply an object that points to a specific row in the table. When the table view asks the data source for a cell, you can look at the row number inside the indexPath.row property to find out the row for which the cell is intended.
        UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.CellReuseID,
                for: indexPath)
            
            if let label = cell.viewWithTag(Constant.CellLabelTag) as? UILabel {
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

                if indexPath.row % 5 == 0 { // indexPath.row contains the row number, and changes the label’s text accordingly.
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

