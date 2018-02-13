//
//  ViewController.swift
//  ChecklistsUpdated
//
//  Created by Jay Henry on 9/27/17.
//  Copyright © 2017 Jay Henry. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    private struct Constant {
        static let NumberOfRows = 100
        static let CellReuseID = "ChecklistItem"
        static let CellLabelTag = 1000
    }
    
    override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection section: Int) -> Int {

        return Constant.NumberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(

                withIdentifier: Constant.CellReuseID,
                for: indexPath)

            if let label = cell.viewWithTag(Constant.CellLabelTag) as? UILabel {

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
            
            }
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
