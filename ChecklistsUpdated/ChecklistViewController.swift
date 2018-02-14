//
//  ViewController.swift
//  ChecklistsUpdated
//
//  Created by Jay Henry on 9/27/17.
//  Copyright © 2017 Jay Henry. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    let row0text = "Walk the dog"
    let row1text = "Brush teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false

    private struct Constant {
        static let NumberOfRows = 5
        static let CellReuseID = "ChecklistItem"
        static let CellLabelTag = 1000
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Constant.NumberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(

                withIdentifier: Constant.CellReuseID, for: indexPath) //is this strange formatting?

            if let label = cell.viewWithTag(Constant.CellLabelTag) as? UILabel {

                if indexPath.row == 0 {
                    label.text = row0text
                } else if indexPath.row == 1 {
                    label.text = row1text
                } else if indexPath.row == 2 {
                    label.text = row2text
                } else if indexPath.row == 3 {
                    label.text = row3text
                } else if indexPath.row == 4 {
                    label.text = row4text
                }
            
            }
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0checked = !row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
            } else if indexPath.row == 3 {
                row3checked = !row3checked
            } else if indexPath.row == 4 {
                row4checked = !row4checked
            }
            
            configureCheckmark(for: cell, at: indexPath)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0checked
        } else if indexPath.row == 1 {
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        } else if indexPath.row == 3 {
            isChecked = row3checked
        } else if indexPath.row == 4 {
            isChecked = row4checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}


