//
//  ViewController.swift
//  ChecklistsUpdated
//
//  Created by Jay Henry on 9/27/17.
//  Copyright © 2017 Jay Henry. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    let mockData = MockData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.CellReuseID)
    }
    
    private struct Constant {
        static let NumberOfRows = 5
        static let CellReuseID = "ChecklistItem"
        static let CellLabelTag = 1000
    }
    
    override func tableView(_ tableView: UITableView, 
                            numberOfRowsInSection section: Int) -> Int {

        return mockData.checklistItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellReuseID,
                                                     for: indexPath)

            if let label = cell.textLabel {
                let checklistItem = mockData.checklistItems[indexPath.row]
                label.text = checklistItem.text
            }
        configureCheckmark(for: cell, at: indexPath, didTap: false)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {

            configureCheckmark(for: cell, at: indexPath, didTap: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath, didTap: Bool) {
        let checklistItem = mockData.checklistItems[indexPath.row]
        if didTap {
            checklistItem.checked = !checklistItem.checked
        }
        
        if checklistItem.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
