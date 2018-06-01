//
//  ChecklistItem.swift
//  ChecklistsUpdated
//
//  Created by Jay Henry on 2/14/18.
//  Copyright © 2018 Jay Henry. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
}

class MockData {
    var checklistItems = [ChecklistItem]()
    

    init() {        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = true
        checklistItems.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Walk the cat"
        row1item.checked = false
        checklistItems.append(row1item)
    }
}
