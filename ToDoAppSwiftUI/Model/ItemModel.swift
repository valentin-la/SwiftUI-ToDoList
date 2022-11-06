//
//  ItemModel.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 20.10.22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let priority: String
    
    
    init(Id: String = UUID().uuidString, Title: String, IsCompleted: Bool, Priority: String) {
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
        self.priority = Priority
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(Id: id, Title: title, IsCompleted: !isCompleted, Priority: priority)
        
    }
}
